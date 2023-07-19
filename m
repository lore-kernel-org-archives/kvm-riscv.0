From: Paul Moore <paul@paul-moore.com>
Date: Tue, 18 Jul 2023 22:14:16 -0400
Subject: [RFC PATCH v11 11/29] security: Export security_inode_init_security_anon()
 for use by KVM
In-Reply-To: <20230718234512.1690985-12-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-12-seanjc@google.com>
Message-ID: <CAHC9VhSUhthtS9W1QkqFd8Y+VHsGVXt1vZenYpqRtr7Gw51B3A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 18, 2023 at 7:48?PM Sean Christopherson <seanjc@google.com> wrote:
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  security/security.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/security.c b/security/security.c
> index b720424ca37d..7fc78f0f3622 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1654,6 +1654,7 @@ int security_inode_init_security_anon(struct inode *inode,
>         return call_int_hook(inode_init_security_anon, 0, inode, name,
>                              context_inode);
>  }
> +EXPORT_SYMBOL_GPL(security_inode_init_security_anon);
>
>  #ifdef CONFIG_SECURITY_PATH
>  /**
> --
> 2.41.0.255.g8b1d071c50-goog

--
paul-moore.com

