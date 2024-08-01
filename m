From: Alex Bennée <alex.bennee@linaro.org>
Date: Thu, 01 Aug 2024 10:53:39 +0100
Subject: [PATCH v12 24/84] KVM: Use plain "struct page" pointer instead
 of single-entry array
In-Reply-To: <20240726235234.228822-25-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:33 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-25-seanjc@google.com>
Message-ID: <87le1gefh8.fsf@draig.linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Use a single pointer instead of a single-entry array for the struct page
> pointer in hva_to_pfn_fast().  Using an array makes the code unnecessarily
> annoying to read and update.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn?e <alex.bennee@linaro.org>

-- 
Alex Benn?e
Virtualisation Tech Lead @ Linaro

