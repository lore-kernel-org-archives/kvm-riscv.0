From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Tue, 02 Feb 2021 19:06:58 -0800 (PST)
Subject: [Announcement] Successful KVM RISC-V bring up on FPGA (Rocket
 core with H extension)
In-Reply-To: <CAOnJCULY7PTcyZ4d0MiC6YBW3_ZdN3tVC4jg_wAJdJs_YeCnMQ@mail.gmail.com>
Message-ID: <mhng-48f94a66-52fd-4e2d-80e8-c33bc521d0f5@penguin>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 02 Feb 2021 00:43:51 PST (-0800), atishp at atishpatra.org wrote:
> Hi,
> We are glad to announce that we are able to boot Linux in KVM guest on
> a FPGA (Rocket chip + H extension v0.6.1). We now have three
> hypervisors working on a Hardware with H extension.
>
> 1. KVM [1]
> 2. Xvisor [2]
> 3. Bao [3]
>
> KVM bring up was done using Firesim and the detailed instructions will
> be available very soon. Here are the software versions used for
> bringup. Please find the attached boot log.
>
> OpenSBI: v0.9
> Linux kernel: 5.11-rc5 + KVM patches(v16) + few kernel fixes [4].
> Kvmtool: Upstream + RISC-V KVMTOOL patches (v6) [5]
>
> We would like to thank Sandro & Jose who implemented the H extension.
> The Rocket-H design is available as an AFI image to be used within
> Firesim or a stand alone FPGA board.
>
> We would also like to thank Andrew/John/Greg & others for defining such
> a clean specification as we did not discover any significant issues
> while doing the bring up. As there are no changes proposed to the H
> extension in the last year, we believe the current version of the H
> extension can be considered as a freeze candidate. Please let us know
> if that is not the case.

Congratulations!   Hopefully we can get this thing frozen, it's been a long 
time.

