Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC50FC44515
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5I1S9fOrMzEqRQUogf+TepyTACjRkeqUke0Js5/NjM=; b=AD44+yEFyxsdit
	zgUWN5WU5/8kvu+BdYQLXDHAV01kkc4aFLxJm5muBG7neQWBmD+nMg70RUpZ4VvREcBKASvmK/7tz
	IMwwM/QwQgKtb+Zc8oCqkPFIqoudrVEOhTl5DxrK57qnpF/9IdZDR4UOufOyJgLsg+xM8gbkxWuAv
	KclgdylaPICTweuFUlKDHUZC54jY4stvoieq6GSwWZcnXvrMEIU7IRA3SHsLy0H+cYGihUKnKg1td
	/NYM+5YVcK5OZVqPkqVRKmecYVOBqahdBsWk6Bq7AhyyZVBux2iP3W/Vnl2TqIusjDrp41vAEHKZP
	I4HUFG8YTRhRqyKxVLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRX-0000000HJ2U-1mK5;
	Thu, 16 Jul 2026 12:43:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRU-0000000HIwO-161u
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:43:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso72422085ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205835; x=1784810635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wO7rgHUMjvOOREbomqim3hRFXtwbnBvZKsCnDiin3lw=;
        b=GG4rnxIudgMhaFvwjZN6dyoWgmgwTUiDZcbBpCKKgfAaNN19d6K3A04gIrdqnrepee
         hRpw1YDLCZFXQp7zs290LCz/bNEaEuWLUu6oTz9zCgXZzbl9lXI6N7cxSQHoeZzrZYhx
         pzPegydmB2JdPXwhEhmp5/uXrgsN+VvjRVDWZy5i+Wtza+GN5ZV8k5C7Hcv0pIqYsJ3z
         TKjbFkI3UPy95Mj3IAJZwtwitPrC2QeO/B56t336GtqJ1AQ9aYEpTJjBP95NJuHaCVPw
         XoKxz5lC5oQaWTDClVBMtDril6aqjsHo61+q5YmEkrHClB88ruXgqdxHM1VqGkOzBm3N
         egeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205835; x=1784810635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wO7rgHUMjvOOREbomqim3hRFXtwbnBvZKsCnDiin3lw=;
        b=mpf228Ta+hVACoQRCwAGzUHLCpLlektPzcMpMToj15oo7yvwcC4mkltxYnyHWIGQDW
         6xXOde7m9EgSnmvbLCi71lAF08xo4jv1wWGcq5QfPc/aNdimQ7hIC4Nzx3iXaRxz+/yq
         M/vEtZplybv4mw8NptCgP1wW+M9mu/y+et6D3CBg6otcpfnJShMIPiKNm7xCndCnM5+E
         KqeRoaz16EQGME7p2okBHXXEIXeyjxO2t7fr3BgBKTyepgw2kaXc+ynyPeT3xR+UPEa6
         mz5gjzIm+3W8pV/WXPT4eLtCKPJ9ghFAW7xhDoKxxHcVYgMYRf+tYHb4xYBR2g71P8+O
         /l6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr5w/vpTsn05nI5h3F37etAF6BUXfvRT3yUZrjBcuzJYPe3CbN5AdxJ2P8q7lQDRxeUyYtw5z2XucU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwX4XQ7oAArnwRvI5uUTyr66O+j6dnTaXhlKtRK12SQm6EHmFB1
	kMp1xLaTjzVS7BsepL6iyPbNeb78nKgXS9Ql4vCH90OdZPhJYteGX9joR7nLXN9U3eHCzf2geN0
	cYnESELE=
X-Gm-Gg: AfdE7cnoXQOItNyvQCNcj+sQYt8kU83dkxd6AoRYc/IXeQJbfB/e+Ow90PBOcUPl+wG
	g1WVpW6hkgNww8tBtlsfAV8uMB5DxcqwkZOdguq38vWXJ4xF4vbmo0JBDhw4XgHaAhG511iMAS3
	5W2lEs+YsyzjJdo0C5/JGTAIUJk0MqDj+1PWHf+/0scLaVyK7hQcfAicMX7uc8Sls1xkLAkBeRv
	qob7314Tk7Cx3LdBa5zjKwWgMG85p4mOaaE8Gar3HLxuXeNFXsMputyDkq7xSl+7FV6KCWJASne
	dQBkj47bE0pHEYM47hNgpjUpUUMqmI1OZDiDTFalxGwg8VUJ+DxT1SmNprsnmVyp0Y1HKfE6TOX
	ENufh5Z85W86lDbRUNr37CHPVs49Ua2rSHaa0pISAS3uif4Ft9YBpjGifFOrIEPmmyPZBu+laWe
	b9XC6p0o7Nd04uJ8K2NxMnUHBdAczxfbsCnA==
X-Received: by 2002:a05:6a20:20c3:b0:3c3:859b:c20c with SMTP id adf61e73a8af0-3c3859be277mr3653741637.15.1784205835267;
        Thu, 16 Jul 2026 05:43:55 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.43.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:43:54 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 08/15] riscv/mm: avoid redundant Svnapot A/D aggregation
Date: Thu, 16 Jul 2026 20:41:43 +0800
Message-Id: <66e43057442a0f37e0c7348016ccef382387898d.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054356_332972_459E7944 
X-CRM114-Status: GOOD (  12.13  )
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

Svnapot mappings encode a 64KB range as a NAPOT PTE block, while the
public getter returns a logical base-page PTE. To preserve that PTE view,
the getter folds accessed and dirty information from the whole NAPOT block
into the returned PTE.

This aggregation is an OR-style operation. Once the returned PTE has both
accessed and dirty state set, later entries in the block cannot change the
result. Avoid reading the rest of the block in that case.

The lockless getter still validates each entry before consuming its A/D
state, so it preserves the self-consistent range requirement while also
avoiding reads that cannot affect the returned PTE.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/mm/contpte.c | 60 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index 9ffdffdc2b0c0..70f9a0668b50c 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -309,10 +309,34 @@ pte_t napotpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 		cur = READ_ONCE(start[i]);
 		if (!napotpte_is_consistent(cur, orig_pte))
 			return napotpte_subpte(ptep, orig_pte);
-		if (pte_dirty(cur))
+		if (pte_dirty(cur)) {
 			pte = riscv_pte_mkhwdirty(pte);
-		if (pte_young(cur))
+			for (; i < nr; i++) {
+				cur = READ_ONCE(start[i]);
+				if (!napotpte_is_consistent(cur, orig_pte))
+					return napotpte_subpte(ptep, orig_pte);
+				if (pte_young(cur)) {
+					pte = pte_mkyoung(pte);
+					break;
+				}
+			}
+			break;
+		}
+
+		if (pte_young(cur)) {
 			pte = pte_mkyoung(pte);
+			i++;
+			for (; i < nr; i++) {
+				cur = READ_ONCE(start[i]);
+				if (!napotpte_is_consistent(cur, orig_pte))
+					return napotpte_subpte(ptep, orig_pte);
+				if (pte_dirty(cur)) {
+					pte = riscv_pte_mkhwdirty(pte);
+					break;
+				}
+			}
+			break;
+		}
 	}
 
 	return napotpte_subpte(ptep, pte);
@@ -343,11 +367,39 @@ pte_t napotpte_ptep_get_lockless(pte_t *orig_ptep)
 		if (!napotpte_is_consistent(pte, orig_pte))
 			goto retry;
 
-		if (pte_dirty(pte))
+		if (pte_dirty(pte)) {
 			orig_pte = riscv_pte_mkhwdirty(orig_pte);
+			for (; i < nr; i++, ptep++) {
+				pte = READ_ONCE(*ptep);
+
+				if (!napotpte_is_consistent(pte, orig_pte))
+					goto retry;
 
-		if (pte_young(pte))
+				if (pte_young(pte)) {
+					orig_pte = pte_mkyoung(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
+
+		if (pte_young(pte)) {
 			orig_pte = pte_mkyoung(orig_pte);
+			i++;
+			ptep++;
+			for (; i < nr; i++, ptep++) {
+				pte = READ_ONCE(*ptep);
+
+				if (!napotpte_is_consistent(pte, orig_pte))
+					goto retry;
+
+				if (pte_dirty(pte)) {
+					orig_pte = riscv_pte_mkhwdirty(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
 	}
 
 	return napotpte_subpte(orig_ptep, orig_pte);
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
