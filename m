From: Reiji Watanabe <reijiw@google.com>
Date: Thu, 21 Apr 2022 23:37:38 -0700
Subject: [PATCH v5 06/13] KVM: arm64: Return a value from
 check_vcpu_requests()
In-Reply-To: <20220409184549.1681189-7-oupton@google.com>
References: <20220409184549.1681189-1-oupton@google.com>
 <20220409184549.1681189-7-oupton@google.com>
Message-ID: <CAAeT=FwDJg5TJb048bCWmS2MM1j0oTXuf0-Gx8WO91JfRJymZw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 9, 2022 at 11:46 AM Oliver Upton <oupton@google.com> wrote:
>
> A subsequent change to KVM will introduce a vCPU request that could
> result in an exit to userspace. Change check_vcpu_requests() to return a
> value and document the function. Unconditionally return 1 for now.
>
> Signed-off-by: Oliver Upton <oupton@google.com>

Reviewed-by: Reiji Watanabe <reijiw@google.com>

