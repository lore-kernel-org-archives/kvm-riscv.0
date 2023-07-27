From: Fuad Tabba <tabba@google.com>
Date: Thu, 27 Jul 2023 11:39:38 +0100
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
Message-ID: <CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQCkdvYaX6Eg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Sean,

<snip>
...

> @@ -5134,6 +5167,16 @@ static long kvm_vm_ioctl(struct file *filp,
>         case KVM_GET_STATS_FD:
>                 r = kvm_vm_ioctl_get_stats_fd(kvm);
>                 break;
> +       case KVM_CREATE_GUEST_MEMFD: {
> +               struct kvm_create_guest_memfd guest_memfd;
> +
> +               r = -EFAULT;
> +               if (copy_from_user(&guest_memfd, argp, sizeof(guest_memfd)))
> +                       goto out;
> +
> +               r = kvm_gmem_create(kvm, &guest_memfd);
> +               break;
> +       }

I'm thinking line of sight here, by having this as a vm ioctl (rather
than a system iocl), would it complicate making it possible in the
future to share/donate memory between VMs?

Cheers,
/fuad

