From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 29 Nov 2021 20:18:50 +0100
Subject: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
In-Reply-To: <YaUiEquKYi5eqWC0@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
 <YaUiEquKYi5eqWC0@google.com>
Message-ID: <880a5727-69d1-72a1-b129-b053781625ad@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/29/21 19:55, Sean Christopherson wrote:
>> Still it does seem to be a race that happens when IS_RUNNING=true but
>> vcpu->mode == OUTSIDE_GUEST_MODE.  This patch makes the race easier to
>> trigger because it moves IS_RUNNING=false later.
> 
> Oh!  Any chance the bug only repros with preemption enabled?  That would explain
> why I don't see problems, I'm pretty sure I've only run AVIC with a PREEMPT=n.

Me too.

> svm_vcpu_{un}blocking() are called with preemption enabled, and avic_set_running()
> passes in vcpu->cpu.  If the vCPU is preempted and scheduled in on a different CPU,
> avic_vcpu_load() will overwrite the vCPU's entry with the wrong CPU info.

That would make a lot of sense.  avic_vcpu_load() can handle 
svm->avic_is_running = false, but avic_set_running still needs its body 
wrapped by preempt_disable/preempt_enable.

Fedora's kernel is CONFIG_PREEMPT_VOLUNTARY, but I know Maxim uses his 
own build so it would not surprise me if he used CONFIG_PREEMPT=y.

Paolo

