Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F96CD6E6D
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nz4xXMbxAraur6HDAWz10aS6vi4oSZ30BKsu36OLIqk=; b=3DfDpzlO3SCqCH
	WR8lkaWE7EngDWJLStvsG6IO4znO9hTMyu1O0cyzavnYGBQzewt+AEFG3DHHDXbyvx4egf4h48GwQ
	VEEWOErpmfeXon0JKu4eFWY14X6CaabSjaKO9wYfsANS7KhreaWmr9FAywHPuNQUiOk+upo9jRL8y
	Gu8vgM8GZ6oNofHwTZ1woVcwOjuboKaAWN86Ov1RZVjstv4rP3/BugsbfK1H6rpvekdPX7wRxyAZC
	OMXxFKE5xKwZkBKvh+Zhzoyo4TTKAF+5rvlGnQ2uJNmqS++1y/MzTv6ExY+rakK6g7e+STkmxyiV3
	I2AM5cxE849HNXRVH58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV93L-0000000GtjT-4AjM;
	Thu, 04 Jun 2026 14:28:12 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV93J-0000000Gtha-2vkI;
	Thu, 04 Jun 2026 14:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=SS
	qjx2KGowuc/Phvlx0zInzCGKJ5fZ8xC0eJIquVxlE=; b=WjW1oxJg3qXYn0dab/
	EsS3+OcV3Kn2jwXw92iHAp+rDDty3aMEppM2T1NHuC7m6Y4pvJIDhpf4KEIm+t8Q
	f5AKnrnF0UK9upYo3SZS4olruJ62cXhux94XH5pKikjebe0QutCVYAAkcH6M6X5M
	hqKpLNPOnRMlBhDq/YUcQUCxw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3VJAIiyFqSKmLAQ--.50067S4;
	Thu, 04 Jun 2026 22:26:22 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH v2 2/2] KVM: selftests: Add a hugetlb memslot alignment test mode
Date: Thu,  4 Jun 2026 22:26:02 +0800
Message-ID: <20260604142602.3582602-3-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604142602.3582602-1-tjytimi@163.com>
References: <20260604142602.3582602-1-tjytimi@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgC3VJAIiyFqSKmLAQ--.50067S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF15Kw47tr45JFWxuw4rKrg_yoWrZr4kpF
	Z5AFn8KFsrJrWfXF4xGw1vkr1Sy3ykGrW0kryYg3yj93y2y3WIvF4xC3W7ZF93CrZ3Zr9a
	va15tF17Wa4DJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziyrWrUUUUU=
X-Originating-IP: [2408:823d:2011:21a8:b05b:a8f3:53a1:f680]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC8Q7IQWohiw5ZvgAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_072810_212592_792E2839 
X-CRM114-Status: GOOD (  17.30  )
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

kvm_page_table_test can already exercise hugetlb-backed guest memory,
but it always creates the test memslot with GPA alignment matching the
hugetlb backing size. That misses the case where a valid hugetlb
memslot is later moved so that the memslot GPA and HVA no longer have
the same offset within the backing huge page.

Add a -u option that moves the test memslot GPA by one guest page after
creating the hugetlb memslot. The memslot is created through the normal
helper first, so the backing allocation remains valid and hugetlb aligned.
Moving the memslot then creates a deliberate HVA/GPA offset mismatch
before the guest mapping is installed.

This mode is useful for checking that architecture MMUs do not install
a block mapping when the block would map the wrong host pages or cover
memory outside the memslot. The option is restricted to hugetlb-backed
test memory because it's specifically about hugetlb block mapping 
eligibility.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
v1 -> v2:
  - Keep the selftest change unchanged from v1

 .../selftests/kvm/kvm_page_table_test.c       | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/kvm_page_table_test.c b/tools/testing/selftests/kvm/kvm_page_table_test.c
index fc5242fb9..a910e3abb 100644
--- a/tools/testing/selftests/kvm/kvm_page_table_test.c
+++ b/tools/testing/selftests/kvm/kvm_page_table_test.c
@@ -230,6 +230,7 @@ struct test_params {
 	u64 phys_offset;
 	u64 test_mem_size;
 	enum vm_mem_backing_src_type src_type;
+	bool misalign_slot_gpa;
 };
 
 static struct kvm_vm *pre_init_before_test(enum vm_guest_mode mode, void *arg)
@@ -244,6 +245,7 @@ static struct kvm_vm *pre_init_before_test(enum vm_guest_mode mode, void *arg)
 	u64 guest_num_pages;
 	u64 alignment;
 	void *host_test_mem;
+	struct userspace_mem_region *region;
 	struct kvm_vm *vm;
 
 	/* Align up the test memory size */
@@ -276,13 +278,22 @@ static struct kvm_vm *pre_init_before_test(enum vm_guest_mode mode, void *arg)
 	/* Add an extra memory slot with specified backing src type */
 	vm_userspace_mem_region_add(vm, src_type, guest_test_phys_mem,
 				    TEST_MEM_SLOT_INDEX, guest_num_pages, 0);
+	region = memslot2region(vm, TEST_MEM_SLOT_INDEX);
+	host_test_mem = region->host_mem;
+
+	if (p->misalign_slot_gpa) {
+		TEST_ASSERT(is_backing_src_hugetlb(src_type),
+			    "Memslot GPA misalignment requires hugetlb backing");
+		TEST_ASSERT(guest_num_pages > 1,
+			    "Need at least two guest pages to misalign memslot GPA");
+
+		guest_test_phys_mem += guest_page_size;
+		vm_mem_region_move(vm, TEST_MEM_SLOT_INDEX, guest_test_phys_mem);
+	}
 
 	/* Do mapping(GVA->GPA) for the testing memory slot */
 	virt_map(vm, guest_test_virt_mem, guest_test_phys_mem, guest_num_pages);
 
-	/* Cache the HVA pointer of the region */
-	host_test_mem = addr_gpa2hva(vm, (gpa_t)guest_test_phys_mem);
-
 	/* Export shared structure test_args to guest */
 	sync_global_to_guest(vm, test_args);
 
@@ -417,8 +428,8 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 static void help(char *name)
 {
 	puts("");
-	printf("usage: %s [-h] [-p offset] [-m mode] "
-	       "[-b mem-size] [-v vcpus] [-s mem-type]\n", name);
+	printf("usage: %s [-h] [-p offset] [-m mode] [-b mem-size]\n", name);
+	printf("          [-v vcpus] [-s mem-type] [-u]\n");
 	puts("");
 	printf(" -p: specify guest physical test memory offset\n"
 	       "     Warning: a low offset can conflict with the loaded test code.\n");
@@ -428,6 +439,8 @@ static void help(char *name)
 	printf(" -v: specify the number of vCPUs to run\n"
 	       "     (default: 1)\n");
 	backing_src_help("-s");
+	printf(" -u: move the test memslot GPA by one guest page after creating\n"
+	       "     the memslot, forcing a hugetlb HVA/GPA offset mismatch\n");
 	puts("");
 }
 
@@ -442,7 +455,7 @@ int main(int argc, char *argv[])
 
 	guest_modes_append_default();
 
-	while ((opt = getopt(argc, argv, "hp:m:b:v:s:")) != -1) {
+	while ((opt = getopt(argc, argv, "hp:m:b:v:s:u")) != -1) {
 		switch (opt) {
 		case 'p':
 			p.phys_offset = strtoull(optarg, NULL, 0);
@@ -461,6 +474,9 @@ int main(int argc, char *argv[])
 		case 's':
 			p.src_type = parse_backing_src_type(optarg);
 			break;
+		case 'u':
+			p.misalign_slot_gpa = true;
+			break;
 		case 'h':
 		default:
 			help(argv[0]);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
