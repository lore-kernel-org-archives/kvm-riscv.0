Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78711CCF2C1
	for <kvm-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 11:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=br+6U7x6bhJkfi7Wj08/il9LpKh6fkMbMJOYFKYkwtg=; b=JPjEUQtIC20et3
	4kvFVGPai+5rW9gDLZ3RwtF+Lk9Is5m4sT7JW56LsbZLGUO4sIomFJLUs4bTxWWT2eGiVwKtfFgnu
	2DEhUXw8DQKe5drrQ0n2JTUbvA40ZRspk8dxurCxPB40CV6ICtrKjLicj7HDOSoFiIbFPh1fiff/y
	Yi7AFLnip3As4sl0M/urMUMAWy5qj2px9Zf3wF3+eUVoZTVcSOmblGqG2c8HqH+rBdSBBx4wILLOe
	RmNupusNtyLViAccHGbKYb2T6IhhCDdZoplAdD9NyvvOgegsX9TDRaW8z/DNHbrvxZVwlpcPf1pa7
	7yiGdgb6S2cwIC6Lwu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2Bl-00000004hCl-3x4i;
	Sat, 17 Oct 2026 11:03:00 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2Bi-00000004hAs-3H57
	for kvm-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 11:02:56 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e946155442so5056465ad.3
        for <kvm-riscv@lists.infradead.org>; Sat, 17 Oct 2026 04:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234974; x=1792839774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIEnM8kSnE++SjvuuMHdYxk0kLmjaVprnb+UtVbFbO0=;
        b=iHA799ZpbMZpbnEYsPJHGJMrYIkW2/ZZA5KbDrZilNHsPKO4CChPbD8MZCo91yxaJg
         jBkQ+nf+SLcuv0EdqHrbcJ4gK3G5NkYh5lr2i344ypxuiIHHfZz1HbY139MyApKDQOgG
         NL/ZrIi02xh1cFW9ALXHbyZc4/kKVoCPCVHECPteZQEAIR+4UiWMHYSiTNzfchsw4Evm
         BMNxpZRkQRQRlqqTeXhgeTu7iAshfYm2CV1AU5BskehkOPJaloZlbejxEPmeatZKpyHe
         jTxLkQNCb9yX6qCajTKBSxdTTlG3wlMHgviCTvFS+Z6KwTiM3l5z0u0g3dy3g9IOMUFC
         ZcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234974; x=1792839774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIEnM8kSnE++SjvuuMHdYxk0kLmjaVprnb+UtVbFbO0=;
        b=TUQGyhM/nY+4TJewxPnIXKTXrkqGPF6xs5qtJE3YcF8xlHhquxAO60xHNNtnaytGRR
         CPsvuEwdXsauzS4XiKwn0sWlQnPv4OG9HJi5m6tvuvrPTAOUFlKxCTYzlNDRj3rSeWmO
         JRK8muuXsX7x6v83tkXrxxx5r/i1mA4RyveSICj9bglpQfbstuD8hJoTR4gpnhIaR8gS
         1c/V+ufIrpJWc8Usi3A7CInHE6PBAGHhEFabJQJS+8xGsQCDbOk7zdHaLXOr+iXeDwEC
         /r0DQ9rhQa8tCoVqV9r71hAq+mgXXie4uyJDBMII3x2PjZj9mfwkDZJ05LqZJ16tWGmk
         B9Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzy/HF6dSMAjJTRa9Ie9/te8bdHWil9ZCk4szKA8Zxy/gh/9nqLidGtEEtqBPYeDHfb9xzO7xTWCqY=@lists.infradead.org
X-Gm-Message-State: AFq9FYLCyTbRbR3af25AHH/aTRyBN4vRdJd2XDwMbIx9n4Qc4EkN9D1A
	UIt3yRLIwNWXSddf94Lh2zHQvH0k8jQlsoz5ziJnNjtUNgH0aHxPheQR
X-Gm-Gg: AYBFou1LOoBn3PRWY7ceDmn6dhxFIn+fTWchrZ/EB6h47tV1M+d8lqVDu1+Oj3/Bske
	59WKnHFbQPyhv2EQwyqajzmkf7dgi4egRjcJXv6939jGmaZi/0D9yy7npEB1kU/AwZh84u7hPyj
	1i3lnp1iDtNKorTK73K1TM4HO7GnzounjKJaNUI5Mc25VyvqeJhPZohHPvdE6nA4yaqUWdlUHKe
	M0HWKCDSVTMw636aJ6Rq8mzr8tWc6Mq6ooe4OGFsATrVzFDJaZq6aBvhtl1W/+5iJxlcB7o9/xP
	kN5AAEggm8c0CPDicFAVrm0EMNAgU1huqeQ2HtqW944s/nSaSiHx5EESUyUf9u7PRHFY9mGO+n7
	cbPpyW90aGhY0yfFARzlqKuu1DjfhDrCWFWG3mHjI5aD2sfQuohP5ZN0PjN7Y1WaqSHFIR49JT0
	9tYe96qvVkBFZpx/tDGeUaKaPOTAeVwmXZl/QFetrKYf2p3WkXwBGMzywze/YAKOOP4fOWADmzg
	BXRZavQtkmspSA9OpA2bOI=
X-Received: by 2002:a17:903:f84:b0:2e8:1f8a:9113 with SMTP id d9443c01a7336-2e9a6f58265mr21900555ad.40.1792234973971;
        Sat, 17 Oct 2026 04:02:53 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:02:53 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 2/5] KVM: selftests: Use the shared memslot base in memslot_perf_test
Date: Sat, 17 Oct 2026 18:02:10 +0700
Message-ID: <20261017110213.46199-3-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040255_814113_550AF73C 
X-CRM114-Status: GOOD (  11.85  )
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

Use TEST_MEM_SLOT_BASE for test memslot IDs and account for the
reserved slots when calculating the available slot count. This
prepares memslot_perf_test for reserving slot 1 for library use.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 .../testing/selftests/kvm/memslot_perf_test.c | 62 +++++++++++--------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index e1299611be32..cbb900ab58af 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -60,7 +60,7 @@
  * other memslot(s).
  *
  * We have different number of memory slots, excluding the reserved
- * memory slot 0, on various architectures and configurations. The
+ * memory slots 0 and 1, on various architectures and configurations. The
  * memory size in this test is calculated by picking the maximal
  * last memory slot's memory size, with alignment to the largest
  * supported page size (64KB). In this way, the selected memory
@@ -68,9 +68,9 @@
  *
  * architecture   slots    memory-per-slot    memory-on-last-slot
  * --------------------------------------------------------------
- * x86-4KB        32763    16KB               160KB
- * arm64-4KB      32766    16KB               112KB
- * arm64-16KB     32766    16KB               112KB
+ * x86-4KB        32762    16KB               176KB
+ * arm64-4KB      32765    16KB               128KB
+ * arm64-16KB     32765    16KB               128KB
  * arm64-64KB     8192     64KB               128KB
  */
 #define MEM_TEST_MOVE_SIZE		(3 * SZ_64K)
@@ -276,7 +276,7 @@ static u64 get_max_slots(struct vm_data *data, u32 host_page_size)
 		rempages = mempages % pages_per_slot;
 		if (check_slot_pages(host_page_size, guest_page_size,
 				     pages_per_slot, rempages))
-			return slots + 1;	/* slot 0 is reserved */
+			return slots + TEST_MEM_SLOT_BASE;
 	}
 
 	return 0;
@@ -313,38 +313,42 @@ static bool prepare_vm(struct vm_data *data, int nslots, u64 *maxslots,
 	data->hva_slots = malloc(sizeof(*data->hva_slots) * data->nslots);
 	TEST_ASSERT(data->hva_slots, "malloc() fail");
 
-	pr_info_v("Adding slots 1..%i, each slot with %"PRIu64" pages + %"PRIu64" extra pages last\n",
-		data->nslots, data->pages_per_slot, rempages);
+	pr_info_v("Adding slots %u..%u, each slot with %" PRIu64
+		  " pages + %" PRIu64 " extra pages last\n",
+		  (u32)TEST_MEM_SLOT_BASE,
+		  TEST_MEM_SLOT_BASE + data->nslots - 1,
+		  data->pages_per_slot, rempages);
 
 	clock_gettime(CLOCK_MONOTONIC, &tstart);
-	for (slot = 1, guest_addr = MEM_GPA; slot <= data->nslots; slot++) {
+	for (slot = 0, guest_addr = MEM_GPA; slot < data->nslots; slot++) {
 		u64 npages;
 
 		npages = data->pages_per_slot;
-		if (slot == data->nslots)
+		if (slot == data->nslots - 1)
 			npages += rempages;
 
 		vm_userspace_mem_region_add(data->vm, VM_MEM_SRC_ANONYMOUS,
-					    guest_addr, slot, npages,
-					    0);
+					    guest_addr, TEST_MEM_SLOT_BASE + slot,
+					    npages, 0);
 		guest_addr += npages * guest_page_size;
 	}
 	*slot_runtime = timespec_elapsed(tstart);
 
-	for (slot = 1, guest_addr = MEM_GPA; slot <= data->nslots; slot++) {
+	for (slot = 0, guest_addr = MEM_GPA; slot < data->nslots; slot++) {
 		u64 npages;
 		gpa_t gpa;
 
 		npages = data->pages_per_slot;
-		if (slot == data->nslots)
+		if (slot == data->nslots - 1)
 			npages += rempages;
 
-		gpa = vm_phy_pages_alloc(data->vm, npages, guest_addr, slot);
+		gpa = vm_phy_pages_alloc(data->vm, npages, guest_addr,
+					 TEST_MEM_SLOT_BASE + slot);
 		TEST_ASSERT(gpa == guest_addr,
 			    "vm_phy_pages_alloc() failed");
 
-		data->hva_slots[slot - 1] = addr_gpa2hva(data->vm, guest_addr);
-		memset(data->hva_slots[slot - 1], 0, npages * guest_page_size);
+		data->hva_slots[slot] = addr_gpa2hva(data->vm, guest_addr);
+		memset(data->hva_slots[slot], 0, npages * guest_page_size);
 
 		guest_addr += npages * guest_page_size;
 	}
@@ -631,9 +635,10 @@ static void test_memslot_move_loop(struct vm_data *data, struct sync_area *sync)
 	u64 movesrcgpa;
 
 	movesrcgpa = vm_slot2gpa(data, data->nslots - 1);
-	vm_mem_region_move(data->vm, data->nslots - 1 + 1,
+	vm_mem_region_move(data->vm, TEST_MEM_SLOT_BASE + data->nslots - 1,
 			   MEM_TEST_MOVE_GPA_DEST);
-	vm_mem_region_move(data->vm, data->nslots - 1 + 1, movesrcgpa);
+	vm_mem_region_move(data->vm, TEST_MEM_SLOT_BASE + data->nslots - 1,
+			   movesrcgpa);
 }
 
 static void test_memslot_do_unmap(struct vm_data *data,
@@ -988,8 +993,10 @@ static bool parse_args(int argc, char *argv[],
 #endif
 		case 's':
 			targs->nslots = atoi_paranoid(optarg);
-			if (targs->nslots <= 1 && targs->nslots != -1) {
-				pr_info("Slot count cap must be larger than 1 or -1 for no cap\n");
+			if (targs->nslots <= TEST_MEM_SLOT_BASE &&
+			    targs->nslots != -1) {
+				pr_info("Slot count cap must be larger than %d or -1 for no cap\n",
+					TEST_MEM_SLOT_BASE);
 				return false;
 			}
 			break;
@@ -1027,20 +1034,21 @@ static bool parse_args(int argc, char *argv[],
 	}
 
 	max_mem_slots = kvm_check_cap(KVM_CAP_NR_MEMSLOTS);
-	if (max_mem_slots <= 1) {
-		pr_info("KVM_CAP_NR_MEMSLOTS should be greater than 1\n");
+	if (max_mem_slots <= TEST_MEM_SLOT_BASE) {
+		pr_info("KVM_CAP_NR_MEMSLOTS should be greater than %d\n",
+			TEST_MEM_SLOT_BASE);
 		return false;
 	}
 
-	/* Memory slot 0 is reserved */
+	/* Memory slots below TEST_MEM_SLOT_BASE are reserved. */
 	if (targs->nslots == -1)
-		targs->nslots = max_mem_slots - 1;
+		targs->nslots = max_mem_slots - TEST_MEM_SLOT_BASE;
 	else
-		targs->nslots = min_t(int, targs->nslots, max_mem_slots) - 1;
+		targs->nslots = min_t(int, targs->nslots, max_mem_slots)
+				- TEST_MEM_SLOT_BASE;
 
 	pr_info_v("Allowed Number of memory slots: %"PRIu32"\n",
-		  targs->nslots + 1);
-
+		 (u32)(targs->nslots + TEST_MEM_SLOT_BASE));
 	return true;
 }
 
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
