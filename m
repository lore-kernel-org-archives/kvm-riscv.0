From: Alex Bennée <alex.bennee@linaro.org>
Date: Thu, 01 Aug 2024 09:57:26 +0100
Subject: [PATCH v12 03/84] KVM: Drop KVM_ERR_PTR_BAD_PAGE and instead
 return NULL to indicate an error
In-Reply-To: <20240726235234.228822-4-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:12 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-4-seanjc@google.com>
Message-ID: <875xskfwnd.fsf@draig.linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Remove KVM_ERR_PTR_BAD_PAGE and instead return NULL, as "bad page" is just
> a leftover bit of weirdness from days of old when KVM stuffed a "bad" page
> into the guest instead of actually handling missing pages.  See commit
> cea7bb21280e ("KVM: MMU: Make gfn_to_page() always safe").
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn?e <alex.bennee@linaro.org>

-- 
Alex Benn?e
Virtualisation Tech Lead @ Linaro

