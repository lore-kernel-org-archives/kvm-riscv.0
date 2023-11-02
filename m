From: Christian Brauner <brauner@kernel.org>
Date: Thu, 2 Nov 2023 17:24:27 +0100
Subject: [PATCH v13 15/35] fs: Export anon_inode_getfile_secure() for use
 by KVM
In-Reply-To: <20231027182217.3615211-16-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-16-seanjc@google.com>
Message-ID: <20231102-freihalten-vorsah-fdd68051b005@brauner>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 27, 2023 at 11:21:57AM -0700, Sean Christopherson wrote:
> Export anon_inode_getfile_secure() so that it can be used by KVM to create
> and manage file-based guest memory without need a fullblow filesystem.
> The "standard" anon_inode_getfd() doesn't work for KVM's use case as KVM
> needs a unique inode for each file, e.g. to be able to independently
> manage the size and lifecycle of a given file.
> 
> Note, KVM doesn't need a "secure" version, just unique inodes, i.e. ignore
> the name.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Before we enshrine this misleading name let's rename this to:

create_anon_inode_getfile()

I don't claim it's a great name but it's better than *_secure() which is
very confusing. So just:

struct file *create_anon_inode_getfile(const char *name,
                                       const struct file_operations *fops,
                                       void *priv, int flags)

May also just remove that context_inode argument from the exported
function. The only other caller is io_uring. And neither it nor this
patchset need the context_inode thing afaict. Merge conflict risk is
extremely low so carrying that as part of this patchset is fine and
shouldn't cause huge issues for you.

