From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 18:30:51 +0100
Subject: [PATCH v13 15/35] fs: Export anon_inode_getfile_secure() for use
 by KVM
In-Reply-To: <20231027182217.3615211-16-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-16-seanjc@google.com>
Message-ID: <50cf2a74-5702-4b7a-8bbc-7f9b5d56b4d1@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/23 20:21, Sean Christopherson wrote:
> Export anon_inode_getfile_secure() so that it can be used by KVM to 
> create and manage file-based guest memory without need a fullblow 

without introducing a full-blown

Otherwise,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> filesystem. The "standard" anon_inode_getfd() doesn't work for KVM's use 
> case as KVM needs a unique inode for each file, e.g. to be able to 
> independently manage the size and lifecycle of a given file.


