From: Vlastimil Babka <vbabka@suse.cz>
Date: Mon, 31 Jul 2023 12:46:22 +0200
Subject: [RFC PATCH v11 11/29] security: Export
 security_inode_init_security_anon() for use by KVM
In-Reply-To: <20230718234512.1690985-12-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-12-seanjc@google.com>
Message-ID: <703da7eb-d08a-3eca-1b98-b5895e41d53b@suse.cz>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/19/23 01:44, Sean Christopherson wrote:
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Process wise this will probably be frowned upon when done separately, so I'd
fold it in the patch using the export, seems to be the next one.

> ---
>  security/security.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/security/security.c b/security/security.c
> index b720424ca37d..7fc78f0f3622 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1654,6 +1654,7 @@ int security_inode_init_security_anon(struct inode *inode,
>  	return call_int_hook(inode_init_security_anon, 0, inode, name,
>  			     context_inode);
>  }
> +EXPORT_SYMBOL_GPL(security_inode_init_security_anon);
>  
>  #ifdef CONFIG_SECURITY_PATH
>  /**


