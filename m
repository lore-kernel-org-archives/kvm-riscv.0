From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 Dec 2022 23:27:06 +0100
Subject: [RFC PATCH 10/37] KVM: MMU: Move struct kvm_page_fault to common
 code
In-Reply-To: <20221208193857.4090582-11-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-11-dmatlack@google.com>
Message-ID: <ce1ea196-d854-18bd-0e60-91985ed5aaea@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/8/22 20:38, David Matlack wrote:
> +
> +	/* Derived from mmu and global state.  */
> +	const bool is_tdp;

I think this could stay in the architecture-independent part.

Paolo


