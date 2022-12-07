From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Dec 2022 00:49:09 -0800
Subject: [RFC 8/9] RISC-V: KVM: Implement perf support
In-Reply-To: <20221202113708.5sxbpnayj75xg6jp@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-9-atishp@rivosinc.com>
 <20221101153112.hpst2bohsdvqours@kamzik> <CAOnJCU++M5jd6toy1J8T+FPGJWSUaw8s9X7sxZY25naPoZeJJw@mail.gmail.com>
 <20221123142254.2mc3j27kgw37jblv@kamzik> <CAOnJCULCHZXLG18BNw=Fn8UaNb8hSMuvLAsA+j_4mX+_B27MYg@mail.gmail.com>
 <20221202113708.5sxbpnayj75xg6jp@kamzik>
Message-ID: <CAOnJCULeEupPNkttCxf5VRoKkff_pdXkZU8SfN-QSu9w-wz4Lw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 2, 2022 at 3:37 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, Dec 02, 2022 at 01:08:47AM -0800, Atish Patra wrote:
> > On Wed, Nov 23, 2022 at 6:22 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Tue, Nov 22, 2022 at 04:45:16PM -0800, Atish Patra wrote:
> > > ...
> > > > This brings up another generic error returning problem in KVM SBI
> > > > land. Usually, SBI error code numbers do not
> > > > align with Linux error codes to accommodate other operating systems.
> > > > However, most of the SBI error codes
> > > > have 1-1 relationship with the Linux error code.
> > > > Thus, kvm internal code returns a Linux specific error code and
> > > > vcpu_sbi will map those to SBI error code using
> > > > kvm_linux_err_map_sbi.
> > > >
> > > > However, this will not work for SBI_ERR_ALREADY_STARTED/STOPPED as
> > > > there are no corresponding
> > > > Linux specific error codes. We can directly return the SBI error codes
> > > > from vcpu_pmu.c and modify the
> > > > kvm_linux_err_map_sbi to pass through those. In that case, we can't
> > > > map any linux error code that
> > > > collides with SBI error code. Any other ideas to handle this case ?
> > > >
> > >
> > > It seems like we should drop kvm_linux_err_map_sbi() and add another
> > > parameter to kvm_vcpu_sbi_extension.handler for the SBI error. Another
> >
> > That will just move the problem from the generic SBI layer to
> > extension specific layer.
> > The root problem remains the same as we can't expect the individual
> > extension to return
> > a valid linux specific error code.
>
> I'm saying we return both from the extension specific layer, particularly
> because only the extension specific layer knows what it should return.
> KVM's SBI handlers currently have a return value and *out_val. *out_val
> maps directly to SBI's sbiret.value, but the return value does not map to
> SBI's sbiret.error. But, all we have to do is add *error_val to the
> parameters for the extension handler to get it. Then, cp->a0 should be set
> to that, not the return value.
>

Ahh. Yes. That will solve this issue.

> >
> > Maybe we can relax that requirement. Thus, any extension that has
> > additional SBI error codes
> > may opt to return SBI error codes directly. For example, PMU extension
> > implementation will
> > directly SBI specific error codes from arch/riscv/kvm/vcpu_pmu.c. In
> > future, there will be other
> > extensions (e.g TEE) will have many more error codes that can leverage
> > this as well.
> >
> > Does that sound reasonable ?
>
> I think we need both the Linux return and sbiret.error. The return value
> indicates a problem *with* the emulation, while the new parameter I'm
> proposing (*error_val) is the return value *of* the emulation. Normally
> the Linux return value will be zero (a successful Linux call) even when
> emulating a failure (*error_val != SBI_SUCCESS). When the return value
> is not zero, then there's something wrong in KVM and the return value
> should be propagated to userspace. We could also set the exit_reason to
> KVM_EXIT_INTERNAL_ERROR, but KVM_EXIT_UNKNOWN is probably fine too.
>

Agreed. I revise the series accordingly. Thanks!

> >
> > > option is to continue mapping SBI errors to Linux errors, e.g.
> > > SBI_ERR_ALREADY_STARTED == EBUSY, but that may not be too easy in
> > > all cases and the errors become ambiguous, as we can't tell if the
> > > Linux implementation generated the error or if the SBI call did.
> > >
> >
> > We can't distinguish between SBI_ERR_ALREADY_STARTED/STOPPED in that case.
>
> That's why I only suggested using EBUSY for STARTED. Mapping STOPPED
> was left as an exercise for the reader :-)
>
> Thanks,
> drew



-- 
Regards,
Atish

