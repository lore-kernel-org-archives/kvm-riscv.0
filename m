From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Tue, 10 May 2022 10:38:10 +0800
Subject: [PATCH v4 03/20] KVM: x86/mmu: Derive shadow MMU page role from
 parent
In-Reply-To: <CALzav=fK9T5YwbiTU1qq7DZuE3E+MVRGDTHpKch7W9jQ9AR8bA@mail.gmail.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-4-dmatlack@google.com>
 <YnRGpDa/kG+9h7Jd@google.com>
 <CALzav=fK9T5YwbiTU1qq7DZuE3E+MVRGDTHpKch7W9jQ9AR8bA@mail.gmail.com>
Message-ID: <CAJhGHyBaaOghrNr77uhi_VYjfubu_Ai2YK0RriOFPEMeJrHeqQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 10, 2022 at 6:10 AM David Matlack <dmatlack@google.com> wrote:

>
> +Lai Jiangshan
>
> It looks like only root pages can be passthrough, so
> kvm_mmu_child_role() can hard-code passthrough to 0. Lai do you agree?
>


Agree.

Thanks
Lai

