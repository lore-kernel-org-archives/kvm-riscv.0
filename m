From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 23 Nov 2022 15:22:54 +0100
Subject: [RFC 8/9] RISC-V: KVM: Implement perf support
In-Reply-To: <CAOnJCU++M5jd6toy1J8T+FPGJWSUaw8s9X7sxZY25naPoZeJJw@mail.gmail.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-9-atishp@rivosinc.com>
 <20221101153112.hpst2bohsdvqours@kamzik>
 <CAOnJCU++M5jd6toy1J8T+FPGJWSUaw8s9X7sxZY25naPoZeJJw@mail.gmail.com>
Message-ID: <20221123142254.2mc3j27kgw37jblv@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 22, 2022 at 04:45:16PM -0800, Atish Patra wrote:
...
> This brings up another generic error returning problem in KVM SBI
> land. Usually, SBI error code numbers do not
> align with Linux error codes to accommodate other operating systems.
> However, most of the SBI error codes
> have 1-1 relationship with the Linux error code.
> Thus, kvm internal code returns a Linux specific error code and
> vcpu_sbi will map those to SBI error code using
> kvm_linux_err_map_sbi.
> 
> However, this will not work for SBI_ERR_ALREADY_STARTED/STOPPED as
> there are no corresponding
> Linux specific error codes. We can directly return the SBI error codes
> from vcpu_pmu.c and modify the
> kvm_linux_err_map_sbi to pass through those. In that case, we can't
> map any linux error code that
> collides with SBI error code. Any other ideas to handle this case ?
>

It seems like we should drop kvm_linux_err_map_sbi() and add another
parameter to kvm_vcpu_sbi_extension.handler for the SBI error. Another
option is to continue mapping SBI errors to Linux errors, e.g.
SBI_ERR_ALREADY_STARTED == EBUSY, but that may not be too easy in
all cases and the errors become ambiguous, as we can't tell if the
Linux implementation generated the error or if the SBI call did.

Thanks,
drew

