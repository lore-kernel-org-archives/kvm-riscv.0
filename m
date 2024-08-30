From: Huang, Kai <kai.huang@intel.com>
Date: Fri, 30 Aug 2024 12:45:07 +0000
Subject: [PATCH v4 06/10] KVM: x86: Rename virtualization {en,dis}abling
 APIs to match common KVM
In-Reply-To: <20240830043600.127750-7-seanjc@google.com>
References: <20240830043600.127750-1-seanjc@google.com>
	 <20240830043600.127750-7-seanjc@google.com>
Message-ID: <0d7c48a9d7cecb69f972bfb3abf3afe91b6ac9a2.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2024-08-29 at 21:35 -0700, Sean Christopherson wrote:
> Rename x86's the per-CPU vendor hooks used to enable virtualization in
> hardware to align with the recently renamed arch hooks.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> 

Reviewed-by: Kai Huang <kai.huang@intel.com>
