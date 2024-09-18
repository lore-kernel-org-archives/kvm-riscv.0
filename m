From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed, 18 Sep 2024 17:49:26 +0200
Subject: [PATCH 1/1] target/riscv: enable floating point unit
In-Reply-To: <20240918-4e2df3f0cabdb8002d7315d9@orel>
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
 <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel>
 <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
 <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
 <CAFEAcA-L7sQfK6MNt1ZbZqUMk+TJor=uD3Jj-Pc6Vy9j9JHhYQ@mail.gmail.com>
 <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com>
 <20240918-4e2df3f0cabdb8002d7315d9@orel>
Message-ID: <620daf0d-caf8-4fe5-901e-2abadb751392@canonical.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 18.09.24 15:56, Andrew Jones wrote:
> Thanks Heinrich, I had also forgotten that distinction. So the last
> question is whether or not we want to reset mstatus.FS to 1 instead of 3,
> as is done in this patch.
> 
> Thanks,
> drew


If the FD flag set to 3 (Dirty) indicates that "the corresponding state 
has potentially been modified since the last context save". Upon context 
switches the value of the floating point registers has to be saved.

The value 1 (Initial) implies that saving the registers on a context 
change is not needed.

3 (Dirty) is the safest choice. This is why OpenSBI is also using it.

For reference:

3.1.6.6. Extension Context Status in mstatus Register
The RISC-V Instruction Set Manual: Volume II - Privileged Architecture
Version 2024-04-11

Best regards

Heinrich

