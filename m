From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Tue, 16 Nov 2021 12:11:19 +0000
Subject: [PATCH 0/4] Address some bad references to Kernel docs
Message-ID: <cover.1637064577.git.mchehab+huawei@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jon,

It follows 4 patches addressing some issues during the 5.16 Kernel development
cycle that were sent to the MLs but weren't merged yet. 

They apply cleanly on the top of 5.16-rc1.

Regards,

Mauro Carvalho Chehab (4):
  libbpf: update index.rst reference
  docs: accounting: update delay-accounting.rst reference
  Documentation: update vcpu-requests.rst reference
  Documentation/process: fix a cross reference

 Documentation/admin-guide/sysctl/kernel.rst  | 2 +-
 Documentation/bpf/index.rst                  | 2 +-
 Documentation/process/submitting-patches.rst | 4 ++--
 arch/riscv/kvm/vcpu.c                        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.33.1



