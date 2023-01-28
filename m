From: Zenghui Yu <zenghui.yu@linux.dev>
Date: Sat, 28 Jan 2023 23:12:50 +0800
Subject: [PATCH v2 2/7] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
In-Reply-To: <20230126184025.2294823-3-dmatlack@google.com>
References: <20230126184025.2294823-1-dmatlack@google.com>
 <20230126184025.2294823-3-dmatlack@google.com>
Message-ID: <2bf4523a-ae8a-1fe2-32b1-25c7e3ae7092@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/1/27 02:40, David Matlack wrote:
> Use kvm_arch_flush_remote_tlbs() instead of
> CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL. The two mechanisms solve the same
> problem, allowing architecture-specific code to provide a non-IPI
> implementation of remote TLB flushing.
> 
> Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
> all architectures on kvm_arch_flush_remote_tlbs() instead of maintaining
> two mechanisms.
> 
> Opt to standardize on kvm_arch_flush_remote_tlbs() since it avoids
> duplicating the generic TLB stats across architectures that implement
> their own remote TLB flush.
> 
> This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> path, but that is a small cost in comparison to flushing remote TLBs.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

Looks good,

Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>

