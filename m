Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A25CCF2C7
	for <kvm-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 11:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1e0SjbdsJEuBZOfFp8Pkzl89eVLKgFmUINBQjJzn9c=; b=yQ7k3VsWZGgiVi
	0xQPAe/JTdj+NqmSWH8tevkohcN8DbT0OwEswrgHtjd1WaNQ/D3ajI4ducyOL+IertoO24qL4BAaz
	t1o3H0ILUo3gMZmD8ilcwqhrh8hWTfBcm2nxHs0vjjV9iBakz7O2KDsJ+fEKuebpluGMrJ2E/97iu
	SlVVaAw0fvuEDCsQa69Nr3hsYRYzC30t3vOc3k68s00J4/iwgSrUklNBxlpYnJqY1J8TZ90bBl89p
	SvJ2tOpM7y1ul5sJzGacw8SNKWId3Jdv03ENiCbQXew/lcRbQB/yCqrsNi2KISFS35kot3T1TtW5A
	fErGI+Zb3rGRp8LNhghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2CM-00000004hZ1-1kNA;
	Sat, 17 Oct 2026 11:03:34 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2C7-00000004hQk-3bAh
	for kvm-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 11:03:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e95bd1c14cso5454265ad.2
        for <kvm-riscv@lists.infradead.org>; Sat, 17 Oct 2026 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234999; x=1792839799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ny7KTMx+qld96qza0vCY0Dx/Bp+/LmW5iI7Izuhy18k=;
        b=IfMTp1WPqg5knQfayfRmDRHqRpwDlB1vj2ygSrUGegUuPn88JY1qspdqN4TYNEp+Q2
         ZNCgOAuyRd9dVzP+PbGnqKWcbVA9C5PnDM+j5L9jBtiUSd1xJxZLyYJtqZgxo7BgnnYS
         c4k/ucemOB2w6bDIFKA6kyctcPcXXCKqWHzJ9sV/goRW00eCAcGcNibxqM/D/96Tan1M
         +Z3t4FMo1Y7mE3QrjfgG/Oe1fp+p3aJHLM+GvpP9kO1bLd7DKEev4kvADdgobndDzpqP
         LKcEkXApdDpVKQHnWSQkVfe+kFQpbUUKU9dUtzrcmIE175NKs2vGzzQwaIjzbyYdyRVh
         Og+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234999; x=1792839799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ny7KTMx+qld96qza0vCY0Dx/Bp+/LmW5iI7Izuhy18k=;
        b=d8zYEUW04FiLWHJ5UkOZe0BYMzuvQlIAOTyRANw71vDs8tBsbAwAhV04TR9hgHemy/
         Gga45vkjSZ4Q8dSesDuSnKneX2ydjZQDFASCik0661eT6GPhaOxMvYjtU7x/lnfNWGTf
         RUOqxA9alj8EwtEiLFbX89CQRxZsIOvXCpxdHdQS2EoTklF+bj1C91PkTbs8ROAPEFLK
         waP6p1HU5ruxq3LxO2QVvtTtmLiiicmzZFcbXFf0zsFvVVHoC6O0C8d95fO7S1JtJx3P
         1os5DsVmU6vnMJL+Ny2U133JgeEJl6wSvBqHBOxMgDVMk3wvwKO+oIOjp5m/Plx5m4rA
         PpoA==
X-Forwarded-Encrypted: i=1; AKwUvByfyKlXvBljXz1f5Cy5L4SD1OF24aEZOrcyKMMSJd1jsdw07MacJ4ky2tduuSgPq0KoGRr3fwpStV0=@lists.infradead.org
X-Gm-Message-State: AFq9FYLN3dLH+FTEu6M1R5Q3CLxK81JovSJ+SpEJtXUE/5MRmGCgXVL0
	m7i3SUEv0Bl7RJGf6cC4A4gdalthc/fWfI2AuyUTYt4szknii5trNzLI
X-Gm-Gg: AYBFou3OAdD9k9m/Bch1v4sIWQXN13FFRjFnY+yImLjablTChM7zQAqijNuqFUqFOdx
	8ODqqWrF1tNAUa9p+V31xEJW4NVP+hSGGH9RYZ3IKvcmK/g2t2ssnqKM5CV88IQKtLCzntOv4Eo
	emSww1VjfccAFjfYG0gBPMsKik5+Sj7SP0/OqfndfSutXZhhdt3KYWL7HE75O33wPsJ2iM/fzPC
	t2SDeLFo10e08PVaPQ9OiVut4CDf3ySciGEsvoCsMMCwcpa8yz9hzxf2xNQ4/P3BYKmRmXNuyPV
	AHe3IOGTeMinfo/9jqZXMwB5lVLI/AeeuRJPbl7k5EVMtATOyi6jdlkx7JahNogyJKx3Wg4P5oZ
	RkOW9E8YtqJq9LsV0dOIs6ZlnLE0E9OxpadzkxbOPTUxB0x4RYBsAgZFqbVfy8uNipnv0tSaNWG
	EbP8i3T7fUd0cKNJAbFRy4ezIykT6iv/MruNcPuFn6SwsWuKvgKOummgvz1dMcE75lCv4ircI2J
	pcsDvlEkz/KVWwE0/Z50A==
X-Received: by 2002:a17:902:d512:b0:2e9:3c24:999 with SMTP id d9443c01a7336-2e9a6c0de51mr23081545ad.40.1792234999087;
        Sat, 17 Oct 2026 04:03:19 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:18 -0700 (PDT)
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
Subject: [PATCH 4/5] KVM: selftests: Reserve memslot 1 for the ucall MMIO address
Date: Sat, 17 Oct 2026 18:02:12 +0700
Message-ID: <20261017110213.46199-5-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040319_894253_C2A80538 
X-CRM114-Status: GOOD (  10.34  )
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

Back the ucall MMIO address with a read-only region in slot 1
when KVM_CAP_READONLY_MEM is available. Writes still exit as
MMIO, while overlapping memslot creation is rejected.

Start test memslots at slot 2, leaving slot 1 reserved by
convention even when read-only memory is unsupported.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 759d604d44ce..4dbb2ef332fc 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -30,7 +30,7 @@
 
 #define KVM_DEV_PATH "/dev/kvm"
 #define KVM_MAX_VCPUS 512
-#define TEST_MEM_SLOT_BASE 1
+#define TEST_MEM_SLOT_BASE 2
 
 #define NSEC_PER_SEC 1000000000L
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9ddc047d5c27..73e28814a226 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 
 #define KVM_UTIL_MIN_PFN	2
+#define KVM_UCALL_MEMSLOT	1
 
 u32 kvm_random_seed;
 struct kvm_random_state kvm_rng;
@@ -492,6 +493,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	struct userspace_mem_region *slot0;
 	struct kvm_vm *vm;
 	int i, flags;
+	gpa_t mmio_gpa;
 
 	kvm_set_files_rlimit(nr_runnable_vcpus);
 
@@ -514,14 +516,19 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 
 	kvm_vm_elf_load(vm, program_invocation_name);
 
-	/*
-	 * TODO: Add proper defines to protect the library's memslots, and then
-	 * carve out memslot1 for the ucall MMIO address.  KVM treats writes to
-	 * read-only memslots as MMIO, and creating a read-only memslot for the
-	 * MMIO region would prevent silently clobbering the MMIO region.
+	/* KVM treats writes to read-only memslots as MMIO, and creating
+	 * a read-only memslot for the MMIO region would prevent silently
+	 * clobbering the MMIO region.
 	 */
 	slot0 = memslot2region(vm, 0);
-	ucall_init(vm, slot0->region.guest_phys_addr + slot0->region.memory_size);
+	mmio_gpa = slot0->region.guest_phys_addr + slot0->region.memory_size;
+	ucall_init(vm, mmio_gpa);
+
+	if (vm_check_cap(vm, KVM_CAP_READONLY_MEM))
+		vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+					    mmio_gpa, KVM_UCALL_MEMSLOT,
+					    vm_adjust_num_guest_pages(vm->mode, 1),
+					    KVM_MEM_READONLY);
 
 	if (kvm_random_seed != last_kvm_seed)
 		kvm_seed_rng(kvm_random_seed);
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
