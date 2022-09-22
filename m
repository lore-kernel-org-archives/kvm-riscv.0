From: Marc Zyngier <maz@kernel.org>
Date: Thu, 22 Sep 2022 15:52:12 +0100
Subject: [PATCH v4 12/12] KVM: remove KVM_REQ_UNHALT
In-Reply-To: <20220921003201.1441511-13-seanjc@google.com>
References: <20220921003201.1441511-1-seanjc@google.com>
	<20220921003201.1441511-13-seanjc@google.com>
Message-ID: <87fsgjjwbn.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 21 Sep 2022 01:32:01 +0100,
Sean Christopherson <seanjc@google.com> wrote:
> 
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> KVM_REQ_UNHALT is now unnecessary because it is replaced by the return
> value of kvm_vcpu_block/kvm_vcpu_halt.  Remove it.
> 
> No functional change intended.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.

