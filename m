From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jan 2023 08:33:56 -0600
Subject: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
In-Reply-To: <20230122191328.1193885-3-ajones@ventanamicro.com>
References: <20230122191328.1193885-1-ajones@ventanamicro.com> <20230122191328.1193885-3-ajones@ventanamicro.com>
Message-ID: <CAL_Jsq+SqFOVYZdf5YCELNo7nnU-T32V_Ec1C+RmUv_eLiR0Ng@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jan 22, 2023 at 1:13 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> The Zicboz operates on a block-size defined for the cpu-core,
> which does not necessarily match other cache-sizes used.

Please use get_maintainers.pl and send patches to the correct lists.

I have no idea what Zicboz is. How does it relate to Zicbom for which
we already have a block size property? I really hate one by one
property additions because they lead to poorly designed bindings. So
what's next? What other information might be needed?

Rob

