From: Sean Christopherson <seanjc@google.com>
Date: Fri, 27 Oct 2023 11:21:57 -0700
Subject: [PATCH v13 15/35] fs: Export anon_inode_getfile_secure() for use by KVM
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
Message-ID: <20231027182217.3615211-16-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Export anon_inode_getfile_secure() so that it can be used by KVM to create
and manage file-based guest memory without need a fullblow filesystem.
The "standard" anon_inode_getfd() doesn't work for KVM's use case as KVM
needs a unique inode for each file, e.g. to be able to independently
manage the size and lifecycle of a given file.

Note, KVM doesn't need a "secure" version, just unique inodes, i.e. ignore
the name.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 fs/anon_inodes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
index 24192a7667ed..4190336180ee 100644
--- a/fs/anon_inodes.c
+++ b/fs/anon_inodes.c
@@ -176,6 +176,7 @@ struct file *anon_inode_getfile_secure(const char *name,
 	return __anon_inode_getfile(name, fops, priv, flags,
 				    context_inode, true);
 }
+EXPORT_SYMBOL_GPL(anon_inode_getfile_secure);
 
 static int __anon_inode_getfd(const char *name,
 			      const struct file_operations *fops,
-- 
2.42.0.820.g83a721a137-goog


