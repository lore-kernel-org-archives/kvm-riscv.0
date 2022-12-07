From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Dec 2022 00:06:04 -0800
Subject: [RFC 8/9] RISC-V: KVM: Implement perf support
In-Reply-To: <Y4oxNbQwOldICdnw@google.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-9-atishp@rivosinc.com>
 <Y4oxNbQwOldICdnw@google.com>
Message-ID: <CAOnJCU+Eo7do0Rd+S4RBOMYpY+sG8ODqpkqA-Cii92bO-cG5+Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 2, 2022 at 9:09 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, Jul 18, 2022, Atish Patra wrote:
> > RISC-V SBI PMU & Sscofpmf ISA extension allows supporting perf in
> > the virtualization enviornment as well. KVM implementation
> > relies on SBI PMU extension for most of the part while traps
> > & emulates the CSRs read for counter access.
>
> For the benefit of non-RISCV people, the changelog (and documentation?) should
> explain why RISC-V doesn't need to tap into kvm_register_perf_callbacks().

As per my understanding, kvm_register_perf_callbacks is only useful
during event sampling for guests. Please let me know if I missed
something.
This series doesn't support sampling and guest counter overflow
interrupt yet.  That's why kvm_register_perf_callbacks support is
missing.
I will add kvm_register_perf_callbacks in the next revision along with
interrupt support.

> Presumably there's something in the "RISC-V SBI PMU & Sscofpmf ISA extension" spec
> that allows hardware to differentiate between events that are for guest vs. host?

Not directly. The Sscofpmf extension does have privilege mode specific
filtering bits[1] i.e. VSINH and VUINH which will indicate if the
events are specific to guest.
But that is only true if the hypervisor has enabled those bits. As I
said above, RISC-V do need to tap into kvm_register_perf_callbacks as
well.

[1] https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit

-- 
Regards,
Atish

