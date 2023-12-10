From: Eric W. Biederman <ebiederm@xmission.com>
Date: Sat, 09 Dec 2023 22:53:30 -0600
Subject: [PATCH v2 1/2] KVM: Use syscore_ops instead of reboot_notifier
 to hook restart/shutdown
In-Reply-To: <cfed942fc767fa7b2fabc68a3357a7b95bd6a589.camel@amazon.com>
	(James Gowans's message of "Sat, 9 Dec 2023 07:26:36 +0000")
References: <20230512233127.804012-1-seanjc@google.com>
	<20230512233127.804012-2-seanjc@google.com>
	<cfed942fc767fa7b2fabc68a3357a7b95bd6a589.camel@amazon.com>
Message-ID: <871qbud5f9.fsf@email.froward.int.ebiederm.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

"Gowans, James" <jgowans@amazon.com> writes:

> Hi Sean,
>
> Blast from the past but I've just been bitten by this patch when
> rebasing across v6.4.
>
> On Fri, 2023-05-12 at 16:31 -0700, Sean Christopherson wrote:
>> Use syscore_ops.shutdown to disable hardware virtualization during a
>> reboot instead of using the dedicated reboot_notifier so that KVM disables
>> virtualization _after_ system_state has been updated.? This will allow
>> fixing a race in KVM's handling of a forced reboot where KVM can end up
>> enabling hardware virtualization between kernel_restart_prepare() and
>> machine_restart().
>
> The issue is that, AFAICT, the syscore_ops.shutdown are not called when
> doing a kexec. Reboot notifiers are called across kexec via:
>
> kernel_kexec
>   kernel_restart_prepare
>     blocking_notifier_call_chain
>       kvm_reboot
>
> So after this patch, KVM is not shutdown during kexec; if hardware virt
> mode is enabled then the kexec hangs in exactly the same manner as you
> describe with the reboot.

kernel_restart_prepare calls device_shutdown.  Which should call all
of the shutdown operations.  This has been the way the code has been
structured since December 2005.

> Some specific shutdown callbacks, for example IOMMU, HPET, IRQ, etc are
> called in native_machine_shutdown, but KVM is not one of these.
>
> Thoughts on possible ways to fix this:
> a) go back to reboot notifiers
> b) get kexec to call syscore_shutdown() to invoke all of these callbacks
> c) Add a KVM-specific callback to native_machine_shutdown(); we only
> need this for Intel x86, right?
>
> My slight preference is towards adding syscore_shutdown() to kexec, but
> I'm not sure that's feasible. Adding kexec maintainers for input.

Why isn't device_suthdown calling syscore_shutdown?

What problem are you running into with your rebase that worked with
reboot notifiers that is not working with syscore_shutdown?

Eric

