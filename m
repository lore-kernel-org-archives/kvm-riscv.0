From: Sean Christopherson <seanjc@google.com>
Date: Fri, 2 Dec 2022 17:09:09 +0000
Subject: [RFC  8/9] RISC-V: KVM: Implement perf support
In-Reply-To: <20220718170205.2972215-9-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-9-atishp@rivosinc.com>
Message-ID: <Y4oxNbQwOldICdnw@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 18, 2022, Atish Patra wrote:
> RISC-V SBI PMU & Sscofpmf ISA extension allows supporting perf in
> the virtualization enviornment as well. KVM implementation
> relies on SBI PMU extension for most of the part while traps
> & emulates the CSRs read for counter access.

For the benefit of non-RISCV people, the changelog (and documentation?) should
explain why RISC-V doesn't need to tap into kvm_register_perf_callbacks().
Presumably there's something in the "RISC-V SBI PMU & Sscofpmf ISA extension" spec
that allows hardware to differentiate between events that are for guest vs. host?

