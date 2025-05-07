Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16950C3ABC9
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olL55NwCGRUakZz5V8xch2VRNoZ4P77j1W1CRthsYMA=; b=gTlTyU2PGcwfwC
	sX7tds4lCa64RGH+C0bYLkJxPbwnq7rnl9Muxz5gBwHa2PzGcop1E7Hw619jXpZj4kyLxKnzVQMoU
	mud1EKE4scY9jnxsk8vM3i83TXWqoLpaGIiaiwEFoyNV3AdKFFB3O9PXZ+uj6XRWx1TsQ1Ry0s4en
	6vkDl7bC+97Qvg4pZnHxlfWBtH+KjDlXHKMse9zyt208hzY+r8Fcbi3mMK2ug9OfyyI8ahi0G13er
	pmnk9Ac/mM9/42z7NsxiRdRUbPcGfNuLwqZZkM2FZ9HtdTwOATKnzsXLoYV6quh/xQqerPJXS8yIU
	1hP1Co6SWx8Hyb8SzIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh0v-0000000G2Fo-3aJr;
	Wed, 07 May 2025 15:48:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgSa-0000000FurF-23Vp
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:13:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 035DE204C;
	Wed,  7 May 2025 08:13:14 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9D4C3F58B;
	Wed,  7 May 2025 08:13:20 -0700 (PDT)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: andrew.jones@linux.dev,
	eric.auger@redhat.com,
	lvivier@redhat.com,
	thuth@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	david@redhat.com,
	pbonzini@redhat.com
Cc: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	joey.gouly@arm.com,
	andre.przywara@arm.com
Subject: [kvm-unit-tests PATCH v3 03/16] configure: Export TARGET unconditionally
Date: Wed,  7 May 2025 16:12:43 +0100
Message-ID: <20250507151256.167769-4-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081324_658848_AB58D546 
X-CRM114-Status: GOOD (  12.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Only arm and arm64 are allowed to set --target to kvmtool; the rest of the
architectures can only set --target to 'qemu', which is also the default.

Needed to make the changes necessary to add support for kvmtool to the test
runner.

kvmtool also supports running the riscv tests, so it's not outside of the
realm of the possibily for the riscv tests to get support for kvmtool.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 configure | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/configure b/configure
index 20bf5042cb9e..8c4400db42bc 100755
--- a/configure
+++ b/configure
@@ -38,6 +38,21 @@ function get_default_qemu_cpu()
     esac
 }
 
+# Return the targets that the architecture supports
+function get_supported_targets()
+{
+    local arch=$1
+
+    case "$arch" in
+    "arm" | "arm64" | "aarch64")
+        echo "qemu kvmtool"
+	;;
+    *)
+        echo "qemu"
+	;;
+    esac
+}
+
 srcdir=$(cd "$(dirname "$0")"; pwd)
 prefix=/usr/local
 cc=gcc
@@ -79,6 +94,7 @@ fi
 usage() {
     [ "$arch" = "aarch64" ] && arch="arm64"
     [ -z "$processor" ] && processor=$(get_default_processor $arch)
+    [ -z $target ] && target=qemu
     cat <<-EOF
 	Usage: $0 [options]
 
@@ -89,8 +105,8 @@ usage() {
 	    --target-cpu=CPU       the CPU model to run on. If left unset, the run script
 	                           selects the best value based on the host system and the
 	                           test configuration.
-	    --target=TARGET        target platform that the tests will be running on (qemu or
-	                           kvmtool, default is qemu) (arm/arm64 only)
+	    --target=TARGET        target platform that the tests will be running on ($target).
+	                           Supported targets: $(get_supported_targets $arch)
 	    --cross-prefix=PREFIX  cross compiler prefix
 	    --cc=CC                c compiler to use ($cc)
 	    --cflags=FLAGS         extra options to be passed to the c compiler
@@ -281,13 +297,11 @@ if [ "$arch" = "riscv" ]; then
     exit 1
 fi
 
-if [ -z "$target" ]; then
-    target="qemu"
-else
-    if [ "$arch" != "arm64" ] && [ "$arch" != "arm" ]; then
-        echo "--target is not supported for $arch"
-        usage
-    fi
+if [ -z $target ]; then
+    target=qemu
+elif ! grep -Fq " $target " <<< " $(get_supported_targets $arch) "; then
+    echo "Target $target is not supported for $arch"
+    usage
 fi
 
 if [ "$efi" ] && [ "$arch" != "x86_64" ] &&
@@ -519,10 +533,8 @@ CONFIG_EFI=$efi
 EFI_DIRECT=$efi_direct
 CONFIG_WERROR=$werror
 GEN_SE_HEADER=$gen_se_header
+TARGET=$target
 EOF
-if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
-    echo "TARGET=$target" >> config.mak
-fi
 
 cat <<EOF > lib/config.h
 #ifndef _CONFIG_H_
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
