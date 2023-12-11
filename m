From: Eric W. Biederman <ebiederm@xmission.com>
Date: Mon, 11 Dec 2023 17:50:33 -0600
Subject: [PATCH v2 1/2] KVM: Use syscore_ops instead of reboot_notifier
 to hook restart/shutdown
In-Reply-To: <7e30cfc2359dfef39d038e3734f7e5e3d9e82d68.camel@amazon.com>
	(James Gowans's message of "Mon, 11 Dec 2023 10:27:15 +0000")
References: <20230512233127.804012-1-seanjc@google.com>
	<20230512233127.804012-2-seanjc@google.com>
	<cfed942fc767fa7b2fabc68a3357a7b95bd6a589.camel@amazon.com>
	<871qbud5f9.fsf@email.froward.int.ebiederm.org>
	<a02b40d3d9ae5b3037b9a9d5921cfb0144ab5610.camel@amazon.com>
	<7e30cfc2359dfef39d038e3734f7e5e3d9e82d68.camel@amazon.com>
Message-ID: <87wmtk9u46.fsf@email.froward.int.ebiederm.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

"Gowans, James" <jgowans@amazon.com> writes:

> On Mon, 2023-12-11 at 09:54 +0200, James Gowans wrote:
>> > 
>> > What problem are you running into with your rebase that worked with
>> > reboot notifiers that is not working with syscore_shutdown?
>> 
>> Prior to this commit [1] which changed KVM from reboot notifiers to
>> syscore_ops, KVM's reboot notifier shutdown callback was invoked on
>> kexec via kernel_restart_prepare.
>> 
>> After this commit, KVM is not being shut down because currently the
>> kexec flow does not call syscore_shutdown.
>
> I think I missed what you're asking here; you're asking for a reproducer
> for the specific failure? 
>
> 1. Launch a QEMU VM with -enable-kvm flag
>
> 2. Do an immediate (-f flag) kexec:
> kexec -f --reuse-cmdline ./bzImage 
>
> Somewhere after doing the RET to new kernel in the relocate_kernel asm
> function the new kernel starts triple faulting; I can't exactly figure
> out where but I think it has to do with the new kernel trying to modify
> CR3 while the VMXE bit is still set in CR4 causing the triple fault.
>
> If KVM has been shut down via the shutdown callback, or alternatively if
> the QEMU process has actually been killed first (by not doing a -f exec)
> then the VMXE bit is clear and the kexec goes smoothly.
>
> So, TL;DR: kexec -f use to work with a KVM VM active, now it goes into a
> triple fault crash.

You mentioned I rebase so I thought your were backporting kernel patches.
By rebase do you mean you porting your userspace to a newer kernel?


In any event I believe the bug with respect to kexec was introduced in
commit 6f389a8f1dd2 ("PM / reboot: call syscore_shutdown() after
disable_nonboot_cpus()").  That is where syscore_shutdown was removed
from kernel_restart_prepare().

At this point it looks like someone just needs to add the missing
syscore_shutdown call into kernel_kexec() right after
migrate_to_reboot_cpu() is called.

That said I am not seeing the reboot notifiers being called on the kexec
path either so your issue with kvm might be deeper.

Eric

