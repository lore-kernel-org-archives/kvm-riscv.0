From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 10 Apr 2024 14:30:20 -0700
Subject: [PATCH 0/4] KVM, mm: remove the .change_pte() MMU notifier and
 set_pte_at_notify()
In-Reply-To: <20240405115815.3226315-1-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
Message-ID: <20240410143020.420cafd47bf8af257b2e647a@linux-foundation.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri,  5 Apr 2024 07:58:11 -0400 Paolo Bonzini <pbonzini@redhat.com> wrote:

> Please review!  Also feel free to take the KVM patches through the mm
> tree, as I don't expect any conflicts.

It's mainly a KVM thing and the MM changes are small and simple.
I'd say that the KVM tree would be a better home?

