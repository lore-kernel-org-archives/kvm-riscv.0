From: Jiahan Zhang <jzhang@tenstorrent.com>
Date: Mon, 24 Apr 2023 14:20:06 -0500
Subject: Question regarding HIE in KVM
Message-ID: <73D248AB-4A4F-4F20-A2A1-57DF9266EDEB@tenstorrent.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I was looking through the KVM source code and it seems like HIE bits are never set to enable VS-level interrupts. However, there is the expected  HVIP write to trigger the interrupt. Am I correct in that KVM doesn?t use HIE? What is the expected behavior in this case?

Thanks
Jiahan
