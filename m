From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 3 Nov 2023 11:40:56 +0100
Subject: [PATCH v13 15/35] fs: Export anon_inode_getfile_secure() for use
 by KVM
In-Reply-To: <20231102-freihalten-vorsah-fdd68051b005@brauner>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-16-seanjc@google.com>
 <20231102-freihalten-vorsah-fdd68051b005@brauner>
Message-ID: <e39a8f6e-c98d-4873-aa3f-2e566dead5c5@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/2/23 17:24, Christian Brauner wrote:
> On Fri, Oct 27, 2023 at 11:21:57AM -0700, Sean Christopherson wrote:
>> Export anon_inode_getfile_secure() so that it can be used by KVM to create
>> and manage file-based guest memory without need a fullblow filesystem.
>> The "standard" anon_inode_getfd() doesn't work for KVM's use case as KVM
>> needs a unique inode for each file, e.g. to be able to independently
>> manage the size and lifecycle of a given file.
>>
>> Note, KVM doesn't need a "secure" version, just unique inodes, i.e. ignore
>> the name.
>>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
> 
> Before we enshrine this misleading name let's rename this to:
> 
> create_anon_inode_getfile()
> 
> I don't claim it's a great name but it's better than *_secure() which is
> very confusing. So just:
> 
> struct file *create_anon_inode_getfile(const char *name,
>                                         const struct file_operations *fops,
>                                         void *priv, int flags)

I slightly prefer anon_inode_create_getfile(); grepping include/linux 
for '\<create_' vs '_create_' shows that this is much more common.

Neither userfaultfd (which uses anon_inode_getfd_secure()) nor io_uring 
strictly speaking need separate inodes; they do want the call to 
inode_init_security_anon().  But I agree that the new name is better and 
I will adjust the comments so that it is clear why you'd use this 
function instead of anon_inode_get{file,fd}().

> May also just remove that context_inode argument from the exported
> function. The only other caller is io_uring. And neither it nor this
> patchset need the context_inode thing afaict.

True, OTOH we might as well rename anon_inode_getfd_secure() to 
anon_inode_create_getfd(), and that one does need context_inode.

I'll Cc you on v14 and will carry the patch in my tree.

Paolo

> Merge conflict risk is
> extremely low so carrying that as part of this patchset is fine and
> shouldn't cause huge issues for you.
> 


