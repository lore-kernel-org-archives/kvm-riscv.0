From: Gowans, James <jgowans@amazon.com>
Date: Mon, 11 Dec 2023 10:27:15 +0000
Subject: [PATCH v2 1/2] KVM: Use syscore_ops instead of reboot_notifier to hook
 restart/shutdown
In-Reply-To: <a02b40d3d9ae5b3037b9a9d5921cfb0144ab5610.camel@amazon.com>
References: <20230512233127.804012-1-seanjc@google.com>
	 <20230512233127.804012-2-seanjc@google.com>
	 <cfed942fc767fa7b2fabc68a3357a7b95bd6a589.camel@amazon.com>
	 <871qbud5f9.fsf@email.froward.int.ebiederm.org>
	 <a02b40d3d9ae5b3037b9a9d5921cfb0144ab5610.camel@amazon.com>
Message-ID: <7e30cfc2359dfef39d038e3734f7e5e3d9e82d68.camel@amazon.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2023-12-11 at 09:54 +0200, James Gowans wrote:
> > 
> > What problem are you running into with your rebase that worked with
> > reboot notifiers that is not working with syscore_shutdown?
> 
> Prior to this commit [1] which changed KVM from reboot notifiers to
> syscore_ops, KVM's reboot notifier shutdown callback was invoked on
> kexec via kernel_restart_prepare.
> 
> After this commit, KVM is not being shut down because currently the
> kexec flow does not call syscore_shutdown.

I think I missed what you're asking here; you're asking for a reproducer
for the specific failure? 

1. Launch a QEMU VM with -enable-kvm flag

2. Do an immediate (-f flag) kexec:
kexec -f --reuse-cmdline ./bzImage 

Somewhere after doing the RET to new kernel in the relocate_kernel asm
function the new kernel starts triple faulting; I can't exactly figure
out where but I think it has to do with the new kernel trying to modify
CR3 while the VMXE bit is still set in CR4 causing the triple fault.

If KVM has been shut down via the shutdown callback, or alternatively if
the QEMU process has actually been killed first (by not doing a -f exec)
then the VMXE bit is clear and the kexec goes smoothly.

So, TL;DR: kexec -f use to work with a KVM VM active, now it goes into a
triple fault crash.

JG

