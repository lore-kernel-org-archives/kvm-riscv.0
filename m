From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Thu, 02 Dec 2021 02:20:45 +0200
Subject: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
In-Reply-To: <458c0819a578ba854f00089bc312c8faa177a81a.camel@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
 <YaUiEquKYi5eqWC0@google.com>
 <880a5727-69d1-72a1-b129-b053781625ad@redhat.com>
 <458c0819a578ba854f00089bc312c8faa177a81a.camel@redhat.com>
Message-ID: <32eabe7d270e5a466ba2d9345b4270b8fe27700c.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2021-11-30 at 00:53 +0200, Maxim Levitsky wrote:
> On Mon, 2021-11-29 at 20:18 +0100, Paolo Bonzini wrote:
> > On 11/29/21 19:55, Sean Christopherson wrote:
> > > > Still it does seem to be a race that happens when IS_RUNNING=true but
> > > > vcpu->mode == OUTSIDE_GUEST_MODE.  This patch makes the race easier to
> > > > trigger because it moves IS_RUNNING=false later.
> > > 
> > > Oh!  Any chance the bug only repros with preemption enabled?  That would explain
> > > why I don't see problems, I'm pretty sure I've only run AVIC with a PREEMPT=n.
> > 
> > Me too.
> > 
> > > svm_vcpu_{un}blocking() are called with preemption enabled, and avic_set_running()
> > > passes in vcpu->cpu.  If the vCPU is preempted and scheduled in on a different CPU,
> > > avic_vcpu_load() will overwrite the vCPU's entry with the wrong CPU info.
> > 
> > That would make a lot of sense.  avic_vcpu_load() can handle 
> > svm->avic_is_running = false, but avic_set_running still needs its body 
> > wrapped by preempt_disable/preempt_enable.
> > 
> > Fedora's kernel is CONFIG_PREEMPT_VOLUNTARY, but I know Maxim uses his 
> > own build so it would not surprise me if he used CONFIG_PREEMPT=y.
> > 
> > Paolo
> > 
> 
> I will write ll the details tomorrow but I strongly suspect the CPU errata 
> https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
> #1235
>  
> Basically what I see that
>  
> 1. vCPU2 disables is_running in avic physical id cache
> 2. vCPU2 checks that IRR is empty and it is
> 3. vCPU2 does schedule();
>  
> and it keeps on sleeping forever. If I kick it via signal 
> (like just doing 'info registers' qemu hmp command
> or just stop/cont on the same hmp interface, the
> vCPU wakes up and notices that IRR suddenly is not empty,
> and the VM comes back to life (and then hangs after a while again
> with the same problem....).
>  
> As far as I see in the traces, the bit in IRR came from
> another VCPU who didn't respect the ir_running bit and didn't get 
> AVIC_INCOMPLETE_IPI VMexit.
> I can't 100% prove it yet, but everything in the trace shows this.
>  
> About the rest of the environment, currently I reproduce this in
> a VM which has no pci passed through devices at all, just AVIC.
> (I wasn't able to reproduce it before just because I forgot to
> enable AVIC in this configuration).
>  
> So I also agree that Sean's patch is not to blame here,
> it just made the window between setting is_running and getting to sleep
> shorter and made it less likely that other vCPUs will pick up the is_running change.
> (I suspect that they pick it up on next vmrun, and otherwise the value is somehow
> cached wrongfully in them).
>  
> A very performance killing workaround of kicking all vCPUs when one of them enters vcpu_block
> does seem to work for me but it skews all the timing off so I can't prove it.
>  
> That is all, I will write more detailed info, including some traces I have.
>  
> I do use windows 10 with so called LatencyMon in it, which shows overall how
> much latency hardware interrupts have, which used to be useful for me to
> ensure that my VMs are suitable for RT like latency (even before I joined RedHat,
> I tuned my VMs as much as I could to make my Rift CV1 VR headset work well which 
> needs RT like latencies.
>  
> These days VR works fine in my VMs anyway, but I still kept this tool to keep an eye on it).
>  
> I really need to write a kvm unit test to stress test IPIs, especially this case,
> I will do this very soon.
>  
>  
> Wei Huang, any info on this would be very helpful. 
>  
> Maybe putting the avic physical table in UC memory would help? 
> Maybe ringing doorbells of all other vcpus will help them notice the change?
> 
> Best regards,
> 	Maxim Levitsky


Hi!

I am now almost sure that this is errata #1235.

I had attached a kvm-unit-test I wrote (patch against master of https://gitlab.com/kvm-unit-tests/kvm-unit-tests.git/)
which is able to reproduce the issue on stock 5.15.0 kernel (*no patches applied at all*) after just few seconds.
If kvm is loaded without halt-polling (that is  halt_poll_ns=0 is used).

Halt polling and/or Sean's patch are not to blame, it just changes timeing.
With Sean's patch I don't need to disable half polling.

I did find few avic inhibition bugs that this test also finds and to make it work before I fix them,
I added a workaround to not hit them in this test.
I'll send patches to fix those very soon.
Note that in windows VM there were no avic inhibitions so those bugs are not relevant.

Wei Huang, do you know if this issue is fixed on Zen3, and if it is fixed on some Zen2 machines?
Any workarounds other than 'don't use avic'?

Best regards,
	Maxim Levitsky

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-add-unit-test-for-avic-ipi.patch
Type: text/x-patch
Size: 5236 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211202/19878ae6/attachment.bin>
