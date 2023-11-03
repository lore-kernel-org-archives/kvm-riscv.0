From: Fuad Tabba <tabba@google.com>
Date: Fri, 3 Nov 2023 09:42:17 +0000
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
Message-ID: <CA+EHjTxEvJpfA7urRj6EbbuwTGWAw6ZYu6NmX9sLT5Cdp5p3eA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

...

> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index e2252c748fd6..e82c69d5e755 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst

...

> +4.141 KVM_CREATE_GUEST_MEMFD
> +----------------------------
> +
> +:Capability: KVM_CAP_GUEST_MEMFD
> +:Architectures: none
> +:Type: vm ioctl
> +:Parameters: struct struct kvm_create_guest_memfd(in)

One struct too many.

Cheers,
/fuad

