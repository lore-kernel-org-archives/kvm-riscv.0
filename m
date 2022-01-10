From: Sean Christopherson <seanjc@google.com>
Date: Mon, 10 Jan 2022 23:06:44 +0000
Subject: [PATCH 3/6] KVM: Remove opaque from
 kvm_arch_check_processor_compat
In-Reply-To: <20211227081515.2088920-4-chao.gao@intel.com>
References: <20211227081515.2088920-1-chao.gao@intel.com>
 <20211227081515.2088920-4-chao.gao@intel.com>
Message-ID: <Ydy8BCfE0jhJd5uE@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 27, 2021, Chao Gao wrote:
> No arch implementation uses this opaque now.

Except for the RISC-V part, this can be a pure revert of commit b99040853738 ("KVM:
Pass kvm_init()'s opaque param to additional arch funcs").  I think it makes sense
to process it as a revert, with a short blurb in the changelog to note that RISC-V
is manually modified as RISC-V support came along in the interim.

