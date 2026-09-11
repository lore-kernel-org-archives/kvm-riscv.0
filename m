Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1279AC88E4D
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MP90oJVTq2iBhx2vSkJbw7nV9dRvhzXjwVy1o/2kngY=; b=RG3Ros2fwT/wiO
	keg/YS+NRht+uTOITDJ77SOuJVrlXMIAhCtSoK8GA8sYcp/iWMvR+IKvDkEWRAHngc/giVWnbbKYR
	VlwOxTShz8SjzAjuA3xJGNGTV3LiE5Z0w8vd/LfNTNVR4Ckz7RkUBN+ZdcOG+1mEqNg1TZa118fVJ
	GwzFe2tHgzW/N3MU2+xMJDIy+Ua58A+cPXdLzEUqLlLveuIM4b4rLxj19yPr6HgOwBVkMXXkmrvES
	7HrQUDw/jo+X8abkQjNiwZo3qElLL0JQUXnb4NQ5QePmeM54X51WIGNPbul00ASU11bLeWZwKhqzT
	tbeMlBoIAw+6Oh4BVE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55SW-0000000HOaD-2WUz;
	Fri, 11 Sep 2026 17:54:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55SV-0000000HOa6-36Jm
	for kvm-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 17:54:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38C99403CD;
	Fri, 11 Sep 2026 17:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E7A1F000FF;
	Fri, 11 Sep 2026 17:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789149283;
	bh=4FwTYwpGmaK+5ispCEK7HH92jJqAfeRrVmWamTSNnqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R/PEF628C82R18CCBiTVgSxDDQxOmmbSQCnHAqmpckaTKvXRHHjbFndk35q0VJwbm
	 kb2jEKyMa0SLgFgUCZjypSy8TU4f91YFYaL79LnYDkmD5YZ7AL7XoikZdUl97oCh3x
	 QlUxYbS81ijVUF5fVhlk944TP7D2LmZtxTQuDrzP5dxAVnzOZPYc7bhPn+cxm0sUWh
	 B4hxxUT5Cc5n6F5+/wjf5RtfTI0VG6FXcU6ZU4ZIB3MMKn1qFBNrVgDZdCZnR5hRoj
	 ktqkGCSA0q7dC/KO31sDOWJ1h+hudAjLc0nPKfhMCyskclXeDI5VaQY7ZPVta2w4Q2
	 g7mHI+jtqwWgA==
Date: Fri, 11 Sep 2026 12:54:37 -0500
From: Serge Hallyn <sergeh@kernel.org>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com,
	michael.roth@amd.com, nsaenz@amazon.com, anelkz@amazon.de,
	James.Bottomley@hansenpartnership.com,
	Melody Wang <huibo.wang@amd.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	x86@kernel.org, coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
Subject: Re: [PATCH 29/60] kvm: Implement KVM_CREATE_PLANE ioctl
Message-ID: <aqRAXTdtUY_Yt8zJ@shallyn-amd>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20260608144252.351443-30-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608144252.351443-30-joro@8bytes.org>
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 08, 2026 at 04:42:21PM +0200, J=F6rg R=F6del wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> =

> Add a new VM ioctl to create a new plane. It returns a new file
> descriptor which supports per-plane ioctls.
> =

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
> Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
> ---
>  include/uapi/linux/kvm.h |  2 ++
>  virt/kvm/kvm_main.c      | 75 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 77 insertions(+)
> =

> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 813f964a6dc1..24e34b8e4819 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1355,6 +1355,8 @@ struct kvm_s390_keyop {
>  #define KVM_GET_DEVICE_ATTR	  _IOW(KVMIO,  0xe2, struct kvm_device_attr)
>  #define KVM_HAS_DEVICE_ATTR	  _IOW(KVMIO,  0xe3, struct kvm_device_attr)
>  =

> +#define KVM_CREATE_PLANE	  _IO(KVMIO, 0xe4)
> +
>  /*
>   * ioctls for vcpu fds
>   */
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 5a0277e2ac7c..03a44ff62f0f 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4843,6 +4843,34 @@ static long kvm_vcpu_compat_ioctl(struct file *fil=
p,
>  }
>  #endif
>  =

> +static long kvm_plane_ioctl(struct file *filp, unsigned int ioctl,
> +			    unsigned long arg)
> +{
> +	struct kvm_plane *plane =3D filp->private_data;
> +
> +	if (plane->kvm->mm !=3D current->mm || plane->kvm->vm_dead)
> +		return -EIO;
> +
> +	switch (ioctl) {
> +	default:
> +		return -ENOTTY;
> +	}
> +}
> +
> +static int kvm_plane_release(struct inode *inode, struct file *filp)
> +{
> +	struct kvm_plane *plane =3D filp->private_data;
> +
> +	kvm_put_kvm(plane->kvm);
> +	return 0;
> +}
> +
> +static struct file_operations kvm_plane_fops =3D {
> +	.unlocked_ioctl =3D kvm_plane_ioctl,
> +	.release =3D kvm_plane_release,
> +	KVM_COMPAT(kvm_plane_ioctl),
> +};
> +
>  static int kvm_device_mmap(struct file *filp, struct vm_area_struct *vma)
>  {
>  	struct kvm_device *dev =3D filp->private_data;
> @@ -5288,6 +5316,49 @@ static int kvm_vm_ioctl_get_stats_fd(struct kvm *k=
vm)
>  	return fd;
>  }
>  =

> +static int kvm_vm_ioctl_create_plane(struct kvm *kvm, unsigned id)
> +{
> +	struct kvm_plane *plane;
> +	struct file *file;
> +	int r, fd;
> +
> +	if (id >=3D kvm_arch_max_planes(kvm) ||
> +	    WARN_ON_ONCE(id >=3D KVM_MAX_PLANES))
> +		return -EINVAL;
> +
> +	guard(mutex)(&kvm->lock);
> +	if (kvm->planes[id])
> +		return -EEXIST;
> +
> +	fd =3D get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0)
> +		return fd;
> +
> +	plane =3D kvm_create_plane(kvm, id);
> +	if (!plane) {
> +		r =3D -ENOMEM;
> +		goto put_fd;
> +	}
> +
> +	kvm_get_kvm(kvm);
> +	file =3D anon_inode_getfile("kvm-plane", &kvm_plane_fops, plane, O_RDWR=
);
> +	if (IS_ERR(file)) {
> +		r =3D PTR_ERR(file);
> +		goto put_kvm;
> +	}
> +
> +	fd_install(fd, file);
> +	return fd;
> +
> +put_kvm:
> +	kvm_put_kvm(kvm);
> +	kvm_destroy_one_plane(plane);

I believe shashiko is right here, and I don't see it changed in a later
patch:  kvm->planes[id] will still point to the now-freed plane.
Probably best if kvm_destroy_one_plane(plane) sets that to NULL itself
after freeing the plane.

> +put_fd:
> +	put_unused_fd(fd);
> +	return r;
> +}
> +
> +
>  #define SANITY_CHECK_MEM_REGION_FIELD(field)					\
>  do {										\
>  	BUILD_BUG_ON(offsetof(struct kvm_userspace_memory_region, field) !=3D		\
> @@ -5306,6 +5377,9 @@ static long kvm_vm_ioctl(struct file *filp,
>  	if (kvm->mm !=3D current->mm || kvm->vm_dead)
>  		return -EIO;
>  	switch (ioctl) {
> +	case KVM_CREATE_PLANE:
> +		r =3D kvm_vm_ioctl_create_plane(kvm, arg);
> +		break;
>  	case KVM_CREATE_VCPU:
>  		r =3D kvm_vm_ioctl_create_vcpu(kvm, arg);
>  		break;
> @@ -6676,6 +6750,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_alig=
n, struct module *module)
>  	kvm_chardev_ops.owner =3D module;
>  	kvm_vm_fops.owner =3D module;
>  	kvm_vcpu_fops.owner =3D module;
> +	kvm_plane_fops.owner =3D module;
>  	kvm_device_fops.owner =3D module;
>  =

>  	kvm_preempt_ops.sched_in =3D kvm_sched_in;
> -- =

> 2.53.0
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
