From: Sean Christopherson <seanjc@google.com>
Date: Mon, 3 Jun 2024 17:23:06 -0700
Subject: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
In-Reply-To: <CADrL8HU734C_OQhzszWJWMXEXLN6HkBo4yweN2fX4BbOegXrFA@mail.gmail.com>
References: <20240529180510.2295118-3-jthoughton@google.com>
 <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
 <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
 <Zl5LqcusZ88QOGQY@google.com> <CADrL8HU734C_OQhzszWJWMXEXLN6HkBo4yweN2fX4BbOegXrFA@mail.gmail.com>
Message-ID: <Zl5eat0sh7rrspUG@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 03, 2024, James Houghton wrote:
> On Mon, Jun 3, 2024 at 4:03?PM Sean Christopherson <seanjc@google.com> wrote:
> > But before we do that, I think we need to perform due dilegence (or provide data)
> > showing that having KVM take mmu_lock for write in the "fast only" API provides
> > better total behavior.  I.e. that the additional accuracy is indeed worth the cost.
> 
> That sounds good to me. I'll drop the Kconfig. I'm not really sure
> what to do about the self-test, but that's not really all that
> important.

Enable it only on architectures+setups that are guaranteed to implement the
fast-only API?  E.g. on x86, it darn well better be active if the TDP MMU is
enabled.  If the test fails because that doesn't hold true, then we _want_ the
failure.

