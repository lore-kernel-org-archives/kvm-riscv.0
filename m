Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD23D3941F
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 02:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82avWECDAGzYkZqfcq8daGLp5Z+clluOa8YubR6gsSc=; b=zgXn33xXxYyRYv
	ZClGYjuM87B3R2pKT4HFTvQaeo0NyFzCEQVZ+fm5+eQmmvwOdL387u+rpVlK/kTxWRYAEyA2yk/JB
	42+jCsotYczcDEVERjDq4X2T8SmroOgGYqGn8gIPnYk/rjKnWz5voLEjab3ZVnTle5LKAf1JPvdFr
	XkWgY9xFTYyiO9rp3RAW8/GsuKfcAqSWM/Rq0/GisfwjINAaLjgTYtsx3B4iWQGCqSxdOmg1rqd6l
	+++7LdDJoN7+9hnyPllpCFNK3qnoNKRfhAuXBd15zCPgZoE35sGMNgr+yukmWB5wDka076WOkSzN5
	z5CRxy2nxu8koXW9rZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8U2F-000000015jG-37HF;
	Fri, 03 Apr 2026 02:13:23 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8U2C-000000015it-3mhm;
	Fri, 03 Apr 2026 02:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775182398; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=gocmGB7MJ4Q1qvd4NluMp0l37EG2b31vDelpHwCN26o=;
	b=mlDGxAUHRd8Tjlg6LeYnPcDMdFiBxJ3R2xbzbgvdUx/e3h5he4W3zu0R7nydAJnr/NfuX6XcjPoabc5IU9pGVFxaohuf24roBmHqPvzthKPCjqpiMl8a19faYH4zSnNUFZGa4XqAPnzyBSWwJcRaeJBD3BY/yMc3Q613HucHZpo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R731e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X0IcLEJ_1775182395;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X0IcLEJ_1775182395 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 10:13:16 +0800
From: fangyu.yu@linux.alibaba.com
To: radim.krcmar@oss.qualcomm.com
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	corbet@lwn.net,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: Re: [PATCH v7 1/4] RISC-V: KVM: Support runtime configuration for per-VM's HGATP mode 
Date: Fri,  3 Apr 2026 10:13:14 +0800
Message-Id: <20260403021314.37990-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <DHIV81G43OJO.2HY4RIYFRD0RL@oss.qualcomm.com>
References: <DHIV81G43OJO.2HY4RIYFRD0RL@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_191321_477394_2AA03D4C 
X-CRM114-Status: UNSURE (   8.21  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Pj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+Cj4+IElu
dHJvZHVjZXMgb25lIHBlci1WTSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgZmllbGRzIHRvIHN1cHBv
cnQgcnVudGltZQo+PiBjb25maWd1cmF0aW9uIG9mIHRoZSBHLXN0YWdlIHBhZ2UgdGFibGUgZm9y
bWF0Ogo+Pgo+PiAtIGt2bS0+YXJjaC5wZ2RfbGV2ZWxzOiB0aGUgY29ycmVzcG9uZGluZyBudW1i
ZXIgb2YgcGFnZSB0YWJsZSBsZXZlbHMKPj4gICBmb3IgdGhlIHNlbGVjdGVkIG1vZGUuCj4+Cj4+
IFRoZXNlIGZpZWxkcyByZXBsYWNlIHRoZSBwcmV2aW91cyBnbG9iYWwgdmFyaWFibGVzCj4+IGt2
bV9yaXNjdl9nc3RhZ2VfbW9kZSBhbmQga3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzLCBlbmFi
bGluZyBkaWZmZXJlbnQKPj4gdmlydHVhbCBtYWNoaW5lcyB0byBpbmRlcGVuZGVudGx5IHNlbGVj
dCB0aGVpciBHLXN0YWdlIHBhZ2UgdGFibGUgZm9ybWF0Cj4+IGluc3RlYWQgb2YgYmVpbmcgZm9y
Y2VkIHRvIHNoYXJlIHRoZSBtYXhpbXVtIG1vZGUgZGV0ZWN0ZWQgYnkgdGhlIGtlcm5lbAo+PiBh
dCBib290IHRpbWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxp
bnV4LmFsaWJhYmEuY29tPgo+PiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9u
ZXNAb3NzLnF1YWxjb21tLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+Cj4+IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4K
Pj4gLS0tCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bS5jIGIvYXJjaC9yaXNjdi9r
dm0vdm0uYwo+PiBAQCAtMTk5LDcgKzE5OSw3IEBAIGludCBrdm1fdm1faW9jdGxfY2hlY2tfZXh0
ZW5zaW9uKHN0cnVjdCBrdm0gKmt2bSwgbG9uZyBleHQpCj4+ICAJCXIgPSBLVk1fVVNFUl9NRU1f
U0xPVFM7Cj4+ICAJCWJyZWFrOwo+PiAgCWNhc2UgS1ZNX0NBUF9WTV9HUEFfQklUUzoKPj4gLQkJ
ciA9IGt2bV9yaXNjdl9nc3RhZ2VfZ3BhX2JpdHM7Cj4+ICsJCXIgPSBrdm1fcmlzY3ZfZ3N0YWdl
X2dwYV9iaXRzKGt2bS0+YXJjaC5wZ2RfbGV2ZWxzKTsKPgo+a3ZtX3ZtX2lvY3RsX2NoZWNrX2V4
dGVuc2lvbigpIGFsc28gZ2V0cyBjYWxsZWQgZnJvbSB3aXRoIGt2bSA9PSBOVUxMCj5mcm9tIGt2
bV9kZXZfaW9jdGwoKS4gIEkgdGhpbmsgd2UgY2FuIGNvbnRpbnVlIHRvIHJldHVybgo+Li4uKGt2
bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMpIGluIHRoYXQgY2FzZS4KPgoKVGhhbmtzIGZv
ciBjYXRjaGluZyB0aGlzLiBJ4oCZbGwgaGFuZGxlIHRoZSBrdm0gPT0gTlVMTCBjYXNlIChmcm9t
IGt2bV9kZXZfaW9jdGwpCmFuZCByZXR1cm4gdGhlIGhvc3QgbWF4aW11bSBiYXNlZCBvbiBrdm1f
cmlzY3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxzIGluIHY4LgoKQWxzbywgaWYgdGhlIGludGVuZGVk
IHNlbWFudGljcyBvZiBLVk1fQ0FQX1ZNX0dQQV9CSVRTIGlzIHRvIHJlcG9ydCB0aGUgbWF4aW11
bQpzdXBwb3J0ZWQgdmFsdWUsIHRoZW4gd2UgY291bGQgc2ltcGx5IGFsd2F5cyByZXR1cm4gdGhl
IGhvc3QgbWF4aW11bSBiYXNlZCBvbgprdm1fcmlzY3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxzLgoK
VGhhbmtzLApGYW5neXUKCj5UaGFua3MuCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
