From: Sean Christopherson <seanjc@google.com>
Date: Fri, 8 Apr 2022 22:24:40 +0000
Subject: [PATCH v3 02/23] KVM: x86/mmu: Use a bool for direct
In-Reply-To: <20220401175554.1931568-3-dmatlack@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
 <20220401175554.1931568-3-dmatlack@google.com>
Message-ID: <YlC2KMSltDRxCi06@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 01, 2022, David Matlack wrote:
> The parameter "direct" can either be true or false, and all of the
> callers pass in a bool variable or true/false literal, so just use the
> type bool.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>

