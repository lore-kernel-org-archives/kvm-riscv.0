From: Michal Prívozník <mprivozn@redhat.com>
Date: Fri, 3 Dec 2021 09:41:56 +0100
Subject: [PATCH v1 00/12] Add riscv kvm accel support
In-Reply-To: <20211120074644.729-1-jiangyifei@huawei.com>
References: <20211120074644.729-1-jiangyifei@huawei.com>
Message-ID: <63d013c1-bacf-2c06-896a-fd9c2b010653@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/20/21 08:46, Yifei Jiang wrote:
> This series adds both riscv32 and riscv64 kvm support, and implements
> migration based on riscv.

What libvirt does when detecting KVM support is issuing query-kvm
monitor command and checking if both 'present' and 'enabled' bools are
true. If this is what these patches end up with we should get KVM
acceleration in Libvirt for free.

Michal


