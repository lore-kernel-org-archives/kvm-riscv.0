From: Huang, Kai <kai.huang@intel.com>
Date: Fri, 30 Aug 2024 12:42:02 +0000
Subject: [PATCH v4 04/10] KVM: Rename arch hooks related to per-CPU
 virtualization enabling
In-Reply-To: <20240830043600.127750-5-seanjc@google.com>
References: <20240830043600.127750-1-seanjc@google.com>
	 <20240830043600.127750-5-seanjc@google.com>
Message-ID: <2dbfc6066e32da4d2c847bf00260313ab8c5aea8.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2024-08-29 at 21:35 -0700, Sean Christopherson wrote:
> Rename the per-CPU hooks used to enable virtualization in hardware to
> align with the KVM-wide helpers in kvm_main.c, and to better capture that
> the callbacks are invoked on every online CPU.
> 
> No functional change intended.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> 

Reviewed-by: Kai Huang <kai.huang@intel.com>
