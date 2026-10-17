Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4CCCCF2C1
	for <kvm-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 11:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yo1pwQXr8HXvBBEAW4nAFAfDimizfwRu7LkEAFKzpf0=; b=KhO9CvscYS0RRN
	WLfyG01as2F/c+pBAqZoNw+SrkvOf5UH6yMbS8IL+tvO4pqJgEp1KVJZh3vCQHYXn9ceraF8wPwz5
	IXwH9KflFnV7ao25Q7Ab3i/qhDXMzhFC7pV2olgBM5/dbLARi4KZCoPTGQqU/9yhOechwmAI2H8IH
	JuF051JaigPp0+Kw0Xq/igscVIQj9KjrQwQ1WDmGPuI24tGFy/lXB5/AJFdMrzu1cwenDFXrvUAKN
	vNaKuzQD6iCGNcPlyRW9Kpn/oWu6oGqnLm4aQ2cN/7dNEt2YKMY2OZ7Pq9Up/4Fk/1fPGopMCkrOk
	zgdeKYHav7CDb8lQ85HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2C2-00000004hLP-1dpw;
	Sat, 17 Oct 2026 11:03:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2Bx-00000004hGq-0qQi
	for kvm-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 11:03:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2e915887d9dso3096555ad.1
        for <kvm-riscv@lists.infradead.org>; Sat, 17 Oct 2026 04:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234988; x=1792839788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2VJKUNI2Amz8x09Pyp10zZpRdq+9eAmweb0GWmitbzg=;
        b=cxtAAR7aW0Fj0K+jovfpkCWlcaaoOVVeHcCFVbP+6AKrRNOmiRkP6oXzK7ikTSd5cn
         0kZdD03UwGFj7xxK3y2IpuJy3TN22ZuYt+CeaERFM4RLJcz+bOwu2UjyuOjosux1kiEq
         DKkmd4ilzEzzAbIny74/pHw3slhsbH+Oz8AC1PF7DLvvnwLlXcRwHLOLtX3wAntV3HJT
         5lQ78NEx+P9YJJY059y0y2EfNwvMnHebuoBE9NAI9IeoyDlBBDKEBlH9REKuumUlVo/B
         fiaXtT9vu7ZTjoaSmHClWh3S6m6sYYHes9GRg90oRV5QHqaSsaiqe9J7ATIBNEXrtkNV
         aCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234988; x=1792839788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2VJKUNI2Amz8x09Pyp10zZpRdq+9eAmweb0GWmitbzg=;
        b=VmutKY8y4U2DUprykbx/4qjyPtItkV5H+QGAOAtDXdJYeFPoF4Ic5vOO4UFYvZL1om
         /Tcpw+ISlkgUnkrv0WU5NewqOEBcKw6XlxrRSMAiVLL4onDlGgtS71MkL8cVZQahUDPk
         jjkD8801TU+JRr2DXUTzUyQOQiP4raq8qJpg8kpCCwSWniw4xPMNPyK0bnSRkCOoqjKt
         f3xYgglEtmuT+qU5iTXiz71p7lWfOTRcSGZHhG0mNyaqCuLTGMnMOc7FCciVZpf49Gz6
         YaDNiIIBV92KQEu7NtVIzw+fKG8Zfj1/nUL5NZZbL72LFcdyiDaFtC5VjUUV3luWLlBB
         H+JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcf/y0EfXvKJ2sZcrKAsmjTAVYgCZKunUDGQKzu+coyxKsrspafvipXIZkFHZV9dVg+SlkZ8H7OZQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYJqgmoM8Wny6126NsCbdjA4NAC7lZ3t+tt8gEBcI3uVaQBtCIHi
	pWtK34SgjvzNmCkcUqmLI5RSvUlUnOm0HSMPbbQlIo2tXGrNB6YPVl+B
X-Gm-Gg: AYBFou28TQN+qgIYqDM8B/EYGOMTGBjmp/3/OcZa30L5nOugNDBt92DluqtgDk4vwW/
	nnX4OBKSZm8Nw1QDkSJmnZNWrqxiCmwjvTK/GtD8fy4HrcvKC/A4ZaMWENhNc2ZACl/uwf9jZxU
	EpOh6yChuvZAOTLqOQsD/4tv3VRbyDPc1qewe3b+wX6ET8rs7VWLegrDzM1XczUssJcpsfXpo+X
	x1i/3o3c3x/FlDLv/RkgS5H4E0acOOaukl7D6UMJA2EjdaHfq1z+8verOhvX45frifaW6k35Mgy
	eMd3Yo4/7qNicg+pvuh3KxjBunR/67pgW5j/E9tT6IK7w7awxqjtPNWIme0r462eqRdoi5XUpYO
	RqdOOnEP0gLFEmhGyc0Si75CrL1rp/p5h+q+i8WJbXJtZU+h9iRpziJvGoM6zpPODyTEqGTcCk/
	riBcxS1Rz2m/fGLfeDWXdBfkgJ85CSHVp8YWlaP9MBcdbr41Gzq2xJDzAnJIb15RqTucwUCHglT
	YjkmFSDDxSinnWvsh7ofA==
X-Received: by 2002:a17:902:e949:b0:2e9:7dda:bfce with SMTP id d9443c01a7336-2e9a6d3c1admr19606475ad.74.1792234988014;
        Sat, 17 Oct 2026 04:03:08 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:07 -0700 (PDT)
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
Subject: [PATCH 3/5] KVM: selftests: Use the shared memslot base in memstress
Date: Sat, 17 Oct 2026 18:02:11 +0700
Message-ID: <20261017110213.46199-4-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040309_237217_613EDD80 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

Define MEMSTRESS_MEM_SLOT_INDEX using TEST_MEM_SLOT_BASE so
memstress and its users follow the library's reserved-slot
convention.

The tests affected but require no change are:
	dirty_log_perf_test.c
	demand_paging_test.c
	access_tracking_perf_test.c
	memslot_modification_stress_test.c
	x86/dirty_log_page_splitting_test.c

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/include/memstress.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/memstress.h b/tools/testing/selftests/kvm/include/memstress.h
index 0d1d6230cc05..4da03541e805 100644
--- a/tools/testing/selftests/kvm/include/memstress.h
+++ b/tools/testing/selftests/kvm/include/memstress.h
@@ -17,7 +17,7 @@
 
 #define DEFAULT_PER_VCPU_MEM_SIZE	(1 << 30) /* 1G */
 
-#define MEMSTRESS_MEM_SLOT_INDEX	1
+#define MEMSTRESS_MEM_SLOT_INDEX	TEST_MEM_SLOT_BASE
 
 struct memstress_vcpu_args {
 	gpa_t gpa;
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
