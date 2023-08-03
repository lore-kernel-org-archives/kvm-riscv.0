From: Ryan Afranji <afranji@google.com>
Date: Thu,  3 Aug 2023 19:15:54 +0000
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
References: <20230718234512.1690985-13-seanjc@google.com>
Message-ID: <20230803191554.205599-1-afranji@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> +static struct folio *kvm_gmem_get_folio(struct file *file, pgoff_t index)
> +{
> +	struct folio *folio;
> +
> +	/* TODO: Support huge pages. */
> +	folio = filemap_grab_folio(file->f_mapping, index);
> +	if (!folio)
> +		return NULL;

In Linux 6.4, filemap_grab_folio() may also return an error value.
Instead of just checking for NULL, "IS_ERR_OR_NULL(folio)" will be needed.

