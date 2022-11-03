From: Sean Christopherson <seanjc@google.com>
Date: Thu, 3 Nov 2022 15:29:58 +0000
Subject: [PATCH 17/44] KVM: arm64: Do arm/arch initialiation without
 bouncing through kvm_init()
In-Reply-To: <dd59d579-4a4e-6db2-eac4-6c5c3ab71fd3@linaro.org>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-18-seanjc@google.com>
 <dd59d579-4a4e-6db2-eac4-6c5c3ab71fd3@linaro.org>
Message-ID: <Y2Pedr1MYt/P1uL0@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 03, 2022, Philippe Mathieu-Daud? wrote:
> Hi Sean,
> 
> On 3/11/22 00:18, Sean Christopherson wrote:
> > Move arm/arch specific initialization directly in arm's module_init(),
> > now called kvm_arm_init(), instead of bouncing through kvm_init() to
> > reach kvm_arch_init().  Invoking kvm_arch_init() is the very first action
> > performed by kvm_init(), i.e. this is a glorified nop.
> > 
> > Making kvm_arch_init() a nop will allow dropping it entirely once all
> > other architectures follow suit.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/arm64/kvm/arm.c | 25 ++++++++++++++++---------
> >   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> >   /* NOP: Compiling as a module not supported */
> >   void kvm_arch_exit(void)
> >   {
> > -	kvm_unregister_perf_callbacks();
> 
> Doesn't this belong to the previous patch?

No, but the above changelog is a lie, there is very much a functional change here.

The goal of the previous patch is to fix the error paths in kvm_arch_init(), a.k.a.
kvm_arm_init().  After fixing kvm_arch_init(), there are still bugs in the sequence
as a whole because kvm_arch_exit() doesn't unwind other state, e.g. kvm_arch_exit()
should really look something like:

  void kvm_arch_exit(void)
  {
	teardown_subsystems();

	if (!is_kernel_in_hyp_mode())
		teardown_hyp_mode();

	kvm_arm_vmid_alloc_free();

	if (is_protected_kvm_enabled())
		???	
  }

Becuase although the comment "NOP: Compiling as a module not supported" is correct
about KVM ARM always having to be built into the kernel, kvm_arch_exit() can still
be called if a later stage of kvm_init() fails.

But rather than add a patch to fix kvm_arch_exit(), I chose to fix the bug by
moving code out of kvm_arch_init() so that the unwind sequence established in the
previous patch could be reused.

Except I managed to forget those details when writing the changelog.  The changelog
should instead be:

  KVM: arm64: Do arm/arch initialization without bouncing through kvm_init()
  
  Do arm/arch specific initialization directly in arm's module_init(), now
  called kvm_arm_init(), instead of bouncing through kvm_init() to reach
  kvm_arch_init().  Invoking kvm_arch_init() is the very first action
  performed by kvm_init(), so from a initialization perspective this is a
  glorified nop.
  
  Avoiding kvm_arch_init() also fixes a mostly benign bug as kvm_arch_exit()
  doesn't properly unwind if a later stage of kvm_init() fails.  While the
  soon-to-be-deleted comment about compiling as a module being unsupported
  is correct, kvm_arch_exit() can still be called by kvm_init() if any step
  after the call to kvm_arch_init() succeeds.

  Add a FIXME to call out that pKVM initialization isn't unwound if
  kvm_init() fails, which is a pre-existing problem inherited from
  kvm_arch_exit().

  Making kvm_arch_init() a nop will also allow dropping kvm_arch_init() and
  kvm_arch_exit() entirely once all other architectures follow suit.

