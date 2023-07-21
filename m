From: Sean Christopherson <seanjc@google.com>
Date: Fri, 21 Jul 2023 10:50:06 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <8ad7a846-64e9-a3f1-4bf1-731a994d62cb@redhat.com>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <8ad7a846-64e9-a3f1-4bf1-731a994d62cb@redhat.com>
Message-ID: <ZLrFTq2f1NXtlJWd@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 21, 2023, Paolo Bonzini wrote:
> On 7/19/23 01:44, Sean Christopherson wrote:
> > +	inode = alloc_anon_inode(mnt->mnt_sb);
> > +	if (IS_ERR(inode))
> > +		return PTR_ERR(inode);
> > +
> > +	err = security_inode_init_security_anon(inode, &qname, NULL);
> > +	if (err)
> > +		goto err_inode;
> > +
> 
> I don't understand the need to have a separate filesystem.  If it is to
> fully setup the inode before it's given a struct file, why not just export
> anon_inode_make_secure_inode instead of security_inode_init_security_anon?

Ugh, this is why comments are important, I can't remember either.

I suspect I implemented a dedicated filesystem to kinda sorta show that we could
allow userspace to provide the mount point with e.g. NUMA hints[*].  But my
preference would be to not support a userspace provided mount and instead implement
fbind() to let userspace control NUMA and whatnot.

[*] https://lore.kernel.org/all/ef48935e5e6f947f6f0c6d748232b14ef5d5ad70.1681176340.git.ackerleytng at google.com

