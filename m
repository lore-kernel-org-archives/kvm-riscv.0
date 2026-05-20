Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D61CD5BAA
	for <kvm-riscv@archiver.kernel.org>; Wed, 20 May 2026 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8c+2qabrY9ZuWDKhwia8/D14QdilqBwFdShmdOeSMw=; b=qvfnCJzVzHO8Ke
	0EY0cpb8IscpEzAd4I3QiAKt6fCWlYuzHJKqts4/P4lFRcglN4192ejB7RU8yAhesG8jN1E/EA4Rz
	zWoWhgIKgyT0xPQTDkt8ddcleRTWuU3wn5GMkE29DjKlddM3Z4m9vl12KExf/XNeeD85jeN0Mbjep
	Dno1LYJgugDqvbwoqLavFx9sOXtTIDm87dykIIFCgTsOXvf6U0VuIio8kbwxAfjqpQAW/Q+RD4F08
	J9ToTmKkrWuecN3KMYtgALRDYNTWBdeybklkAIC4UblZEozWK4F/Xso7Te/Z835q8hnppeyWDNSw/
	TBv3Qe2rdiAiP7rsbAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPilb-00000004y41-3BV4;
	Wed, 20 May 2026 15:23:27 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPilY-00000004y2B-1OIb;
	Wed, 20 May 2026 15:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7r
	oBFKdGulDRfEdbUj9Nj2SOy6QsUypGN0bSOEP8gYU=; b=X1EUBpJ/V4CqOTlztu
	Sj6q+1stEcF13AKPJ2ZUM8LqO4U079SKxoBx3Gi9XzliMn9sx0Dsv7ktlZvmHWJN
	8ZjyBncvfF8exP4AzcGPaJCTS0wEe/yRI6b99VIxiueFknSf3wlEawys8fKxMzTS
	bFd2+yRoG3DTNKiiNShOMUvJA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAnt1md0Q1qGHMGCg--.33359S5;
	Wed, 20 May 2026 23:22:12 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <apatel@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm <kvm@vger.kernel.org>,
	kvm-riscv <kvm-riscv@lists.infradead.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH 3/3] KVM: selftests: Add a hugetlb memslot alignment test mode
Date: Wed, 20 May 2026 23:21:48 +0800
Message-ID: <20260520152148.131272-4-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520152148.131272-1-tjytimi@163.com>
References: <20260520152148.131272-1-tjytimi@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAnt1md0Q1qGHMGCg--.33359S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF15Kw47tr45JFWxuw4rKrg_yoWrCFWxpa
	s5A3Z8KFsrJrWxXF4xGw1vkr1Sy3ykG3y0yryYg3yj93y7tw1IvF4xCF17ZF93CrZ3ZrZa
	va15tF17Wa4DJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRiiSdUUUUU=
X-Originating-IP: [2408:823d:2011:b54:c309:80a7:694d:2e40]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbCzwV782oN0aVUngAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082324_841270_6DD54896 
X-CRM114-Status: GOOD (  17.37  )
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
test memory because it's specifically about hugetlb block
mapping eligibility.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
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
