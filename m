From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 18 Sep 2024 08:05:13 +0200
Subject: [PATCH 1/1] target/riscv: enable floating point unit
In-Reply-To: <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
 <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
Message-ID: <20240918-039d1e3bebf2231bd452a5ad@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 17, 2024 at 06:45:21PM GMT, Heinrich Schuchardt wrote:
...
> When thinking about the migration of virtual machines shouldn't QEMU be in
> control of the initial state of vcpus instead of KVM?
>

Thinking about this more, I'm inclined to agree. Initial state and reset
state should be traits of the VMM (potentially influenced by the user)
rather than KVM.

Thanks,
drew

