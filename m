From: Gowans, James <jgowans@amazon.com>
Date: Mon, 11 Dec 2023 07:54:42 +0000
Subject: [PATCH v2 1/2] KVM: Use syscore_ops instead of reboot_notifier to hook
 restart/shutdown
In-Reply-To: <871qbud5f9.fsf@email.froward.int.ebiederm.org>
References: <20230512233127.804012-1-seanjc@google.com>
	 <20230512233127.804012-2-seanjc@google.com>
	 <cfed942fc767fa7b2fabc68a3357a7b95bd6a589.camel@amazon.com>
	 <871qbud5f9.fsf@email.froward.int.ebiederm.org>
Message-ID: <a02b40d3d9ae5b3037b9a9d5921cfb0144ab5610.camel@amazon.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2023-12-09 at 22:53 -0600, Eric W. Biederman wrote:
> > On Fri, 2023-05-12 at 16:31 -0700, Sean Christopherson wrote:
> > > Use syscore_ops.shutdown to disable hardware virtualization during a
> > > reboot instead of using the dedicated reboot_notifier so that KVM disables
> > > virtualization _after_ system_state has been updated.? This will allow
> > > fixing a race in KVM's handling of a forced reboot where KVM can end up
> > > enabling hardware virtualization between kernel_restart_prepare() and
> > > machine_restart().
> > 
> > The issue is that, AFAICT, the syscore_ops.shutdown are not called when
> > doing a kexec. Reboot notifiers are called across kexec via:
> > 
> > kernel_kexec
> > ?? kernel_restart_prepare
> > ???? blocking_notifier_call_chain
> > ?????? kvm_reboot
> > 
> > So after this patch, KVM is not shutdown during kexec; if hardware virt
> > mode is enabled then the kexec hangs in exactly the same manner as you
> > describe with the reboot.
> 
> kernel_restart_prepare calls device_shutdown.? Which should call all
> of the shutdown operations.? This has been the way the code has been
> structured since December 2005.

Yes, kernel_reset_prepare calls device_shutdown which calls
dev->driver->shutdown for each dev which has a driver. KVM, however, is
not a dev with a driver, hence doesn't have a dev->driver->shutdown
callback. So KVM is no-op'ed in device_shutdown.

KVM adds its shutdown callback to syscore_ops and expects to be shut
down that way.

> 
> > Some specific shutdown callbacks, for example IOMMU, HPET, IRQ, etc are
> > called in native_machine_shutdown, but KVM is not one of these.
> > 
> > Thoughts on possible ways to fix this:
> > a) go back to reboot notifiers
> > b) get kexec to call syscore_shutdown() to invoke all of these callbacks
> > c) Add a KVM-specific callback to native_machine_shutdown(); we only
> > need this for Intel x86, right?
> > 
> > My slight preference is towards adding syscore_shutdown() to kexec, but
> > I'm not sure that's feasible. Adding kexec maintainers for input.
> 
> Why isn't device_suthdown calling syscore_shutdown?

I'm not sure - that would indeed be one way to fix; adding a call to
syscore_shutdown() inside device_shutdown. We may need to clean up other
callers to not do their own syscore_shutdown and rather depend on
device_shutdown to do it all.

Would you support adding syscore_shutdown() to device_shutdown()?

> 
> What problem are you running into with your rebase that worked with
> reboot notifiers that is not working with syscore_shutdown?

Prior to this commit [1] which changed KVM from reboot notifiers to
syscore_ops, KVM's reboot notifier shutdown callback was invoked on
kexec via kernel_restart_prepare.

After this commit, KVM is not being shut down because currently the
kexec flow does not call syscore_shutdown.

JG


[1] https://github.com/torvalds/linux/commit/6735150b6997
