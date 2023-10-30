From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 18:39:25 +0100
Subject: [PATCH v13 00/35] KVM: guest_memfd() and per-page attributes
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
Message-ID: <80471c15-a37e-4129-8101-d30b8f73cb9f@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/23 20:21, Sean Christopherson wrote:
> Non-KVM people, please take a gander at two small-ish patches buried in the
> middle of this series:
> 
>    fs: Export anon_inode_getfile_secure() for use by KVM
>    mm: Add AS_UNMOVABLE to mark mapping as completely unmovable
> 
> Our plan/hope is to take this through the KVM tree for 6.8, reviews (and acks!)
> would be much appreciated.  Note, adding AS_UNMOVABLE isn't strictly required as
> it's "just" an optimization, but we'd prefer to have it in place straightaway.

Reporting what I wrote in the other thread, for wider distribution:

I'm going to wait a couple days more for reviews to come in, post a v14
myself, and apply the series to kvm/next as soon as Linus merges the 6.7
changes.  The series will be based on the 6.7 tags/for-linus, and when
6.7-rc1 comes up, I'll do this to straighten the history:

	git checkout kvm/next
	git tag -s -f kvm-gmem HEAD
	git reset --hard v6.7-rc1
	git merge tags/kvm-gmem
	# fix conflict with Christian Brauner's VFS series
	git commit
	git push kvm

6.8 is not going to be out for four months, and I'm pretty sure that
anything that would be discovered within "a few weeks" can also be
applied on top, and the heaviness of a 35-patch series will outweigh any
imperfections by a long margin.

(Full disclosure: this is _also_ because I want to apply this series to
the RHEL kernel, and Red Hat has a high level of disdain for
non-upstream patches.  But it's mostly because I want all dependencies
to be able to move on and be developed on top of stock kvm/next).

Paolo


