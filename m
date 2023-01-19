From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 19 Jan 2023 18:23:49 +0100
Subject: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common code
In-Reply-To: <Y8l6egh2wWN7BUlZ@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <Y8l6egh2wWN7BUlZ@google.com>
Message-ID: <CABgObfaTEZ1_SaQ9ThbeMe8gX2y35ZGTFzgb9K9yZwz8dbOYdQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 19, 2023 at 6:14 PM David Matlack <dmatlack@google.com> wrote:
> Paolo and Sean, what are your thoughts on merging the Common MMU
> refactor without RISC-V support?

I have no objection. We know what the long-term plan is, and it's not
so long-term anyway.

Paolo


