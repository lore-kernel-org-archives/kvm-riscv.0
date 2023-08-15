From: Sean Christopherson <seanjc@google.com>
Date: Tue, 15 Aug 2023 15:30:47 -0700
Subject: [PATCH v9 01/14] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
In-Reply-To: <20230811045127.3308641-2-rananta@google.com>
References: <20230811045127.3308641-1-rananta@google.com> <20230811045127.3308641-2-rananta@google.com>
Message-ID: <ZNv8l3mmC/vtqf3j@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 11, 2023, Raghavendra Rao Ananta wrote:
> From: David Matlack <dmatlack@google.com>
> 
> Rename kvm_arch_flush_remote_tlb() and the associated macro
> __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB to kvm_arch_flush_remote_tlbs() and
> __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS respectively.
> 
> Making the name plural matches kvm_flush_remote_tlbs() and makes it more
> clear that this function can affect more than one remote TLB.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>

