From: Sean Christopherson <seanjc@google.com>
Date: Wed, 12 Jan 2022 17:20:44 +0000
Subject: [PATCH 3/6] KVM: Remove opaque from
 kvm_arch_check_processor_compat
In-Reply-To: <20220111031933.GB2175@gao-cwp>
References: <20211227081515.2088920-1-chao.gao@intel.com>
 <20211227081515.2088920-4-chao.gao@intel.com>
 <Ydy8BCfE0jhJd5uE@google.com> <20220111031933.GB2175@gao-cwp>
Message-ID: <Yd8N7PFqZbACzh2r@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 11, 2022, Chao Gao wrote:
> On Mon, Jan 10, 2022 at 11:06:44PM +0000, Sean Christopherson wrote:
> >On Mon, Dec 27, 2021, Chao Gao wrote:
> >> No arch implementation uses this opaque now.
> >
> >Except for the RISC-V part, this can be a pure revert of commit b99040853738 ("KVM:
> >Pass kvm_init()'s opaque param to additional arch funcs").  I think it makes sense
> >to process it as a revert, with a short blurb in the changelog to note that RISC-V
> >is manually modified as RISC-V support came along in the interim.
> 
> commit b99040853738 adds opaque param to kvm_arch_hardware_setup(), which isn't
> reverted in this patch. I.e., this patch is a partial revert of b99040853738
> plus manual changes to RISC-V. Given that, "process it as a revert" means
> clearly say in changelog that this commit contains a partial revert of commit
> b99040853738 ("KVM: Pass kvm_init()'s opaque param to additional arch funcs").
> 
> Right?

What I meant is literally do

  git revert -s b99040853738

and then manually handle RISC-V.

