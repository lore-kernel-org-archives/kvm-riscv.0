Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FACFC982DF
	for <kvm-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 03:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L15oKY8E+QNhKT/nU9p+cqIcHX2zAPBTR1WijXOreTA=; b=iu0ek84JWifpBF
	KwO6BRsBiEpxI2gh5jQHDW9iA9dXkeMm4CG8SawQgF3rS8Z7BrTErmiAx38oSIEG9W3F0+iG7LPb+
	iSdeAVb0/K8uz4YtA63ZcN9jvbODINkPW24v8kNI0L8clgQFbQljrgKGZMJsXiyEVL730oMKg9xgM
	NbJxPUMbn5be6XuyTEN5zqwMseH1VOQj7SXY7ovAnStmUhJZzzCQ51UInZNItFpCrUAPtNx7g7JcA
	i8zJw8mKfS9PmrJ4mVOukP66DhFq2/XVveEqUM1vf97pCop+QM4oAGi3V6XasG/BCsQzL4sKfpeL0
	KRzjAk3DWAuzHbIEVHBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x87zK-0000000Gmpq-3jvp;
	Sun, 20 Sep 2026 03:13:10 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x87zH-0000000GmpQ-3J2R;
	Sun, 20 Sep 2026 03:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789873984; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=LHI1NO5JOiIuDGqpEcnCt7eW+JpawOKMKxw6jmu4FBU=;
	b=AhQtYMOFkjDvbUg9dmr3r/BsoOeqxYWy2rTtKYfhXoj+OlbTgv5oybb1ouxlzfeMJHd2hlt3NySN5MzH44sbpoZhfuBczjgLmG74Mt0sHIXOHyo4v2ZwWlrn6Wh90b7pE1rR5YJJjMS4GFRUHTmwrRVQSCe+1QTuJrAlOOTtFu0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XBErlvu_1789873979;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XBErlvu_1789873979 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 20 Sep 2026 11:13:01 +0800
From: fangyu.yu@linux.alibaba.com
To: gsh517025@gmail.com
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v4 08/10] iommu/riscv: Pre-enable GADE for second-stage domains 
Date: Sun, 20 Sep 2026 11:12:59 +0800
Message-Id: <20260920031259.20950-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <90826872-1374-49e4-832d-555abf8e8369@gmail.com>
References: <90826872-1374-49e4-832d-555abf8e8369@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_201308_010756_012BA7CA 
X-CRM114-Status: GOOD (  18.66  )
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

PkhpIEZhbmd5dSwKPgo+T24gOS8xNS8yMDI2IDExOjI4IEFNLCBmYW5neXUueXVAbGludXguYWxp
YmFiYS5jb20gd3JvdGU6Cj4+IEZyb206IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJh
YmEuY29tPgo+Pgo+PiBQcmUtZW5hYmxlIFJJU0NWX0lPTU1VX0RDX1RDX0dBREUgaW4gdGhlIGRl
dmljZSBjb250ZXh0IHdoZW4KPj4gYXR0YWNoaW5nIGEgc2Vjb25kLXN0YWdlIGRvbWFpbiwgaWYg
dGhlIElPTU1VIHN1cHBvcnRzIEFNT19IV0FELgo+Pgo+PiBTb2Z0d2FyZSBwcmUtcG9wdWxhdGVz
IHNlY29uZC1zdGFnZSBwYWdlIHRhYmxlcyB3aXRoIEQgc2V0LCBzbwo+PiBlbmFibGluZyBHQURF
IGJ5IGRlZmF1bHQgZG9lcyBub3QgY2hhbmdlIG5vcm1hbCBiZWhhdmlvci4gV2hlbgo+PiBkaXJ0
eSB0cmFja2luZyBpcyBlbmFibGVkLCBpb21tdWZkIGNsZWFycyB0aGUgcHJlLXNldCBEIGJpdHMg
YW5kCj4+IEdBREUgYmVjb21lcyBuZWNlc3NhcnkgZm9yIGhhcmR3YXJlIHRvIHVwZGF0ZSB0aGUg
ZGlydHkgYml0IG9uCj4+IHdyaXRlIGFjY2Vzcy4KPj4KPj4gVGhpcyBhdm9pZHMgdG9nZ2xpbmcg
R0FERSBkeW5hbWljYWxseSBhbmQga2VlcHMgZGV2aWNlIGNvbnRleHQKPj4gc2V0dXAgY29uc2lz
dGVudCB3aXRoIHNlY29uZC1zdGFnZSBkb21haW4gYXR0YWNobWVudC4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+IC0tLQo+PiAg
IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyB8IDIgKysKPj4gICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lv
bW11LmMgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPj4gaW5kZXggMTY3Nzk4NzczNTFi
Li5mMDFmZDRlMmY4NDAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUu
Ywo+PiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPj4gQEAgLTEzMzAsNiArMTMz
MCw4IEBAIHN0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfYXR0YWNoX3BhZ2luZ19kb21haW4oc3RydWN0
IGlvbW11X2RvbWFpbiAqaW9tbXVfZG9tYWluLAo+PiAgIAkJCUZJRUxEX1BSRVAoUklTQ1ZfSU9N
TVVfRENfSU9IR0FUUF9NT0RFLCBwdF9pbmZvLmlvaGdhdHBfbW9kZSkgfAo+PiAgIAkJCUZJRUxE
X1BSRVAoUklTQ1ZfSU9NTVVfRENfSU9IR0FUUF9HU0NJRCwgZG9tYWluLT5nc2NpZCkgfAo+PiAg
IAkJCUZJRUxEX1BSRVAoUklTQ1ZfSU9NTVVfRENfSU9IR0FUUF9QUE4sIHB0X2luZm8ucHBuKTsK
Pj4gKwkJaWYgKGlvbW11LT5jYXBzICYgUklTQ1ZfSU9NTVVfQ0FQQUJJTElUSUVTX0FNT19IV0FE
KQo+PiArCQkJZGMudGMgfD0gUklTQ1ZfSU9NTVVfRENfVENfR0FERTsKCkhpIFNodWFpOgoKPgo+
SSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IEkgZG9uJ3Qgc2VlIGhvdyB0aGUgR0FE
RSBiaXQgc2V0Cj5oZXJlIHJlYWNoZXMgdGhlIGhhcmR3YXJlIElPTU1VIERDLiBJbiByaXNjdl9p
b21tdV9pb2Rpcl91cGRhdGUoKQo+KGluIHBhdGNoIDA0LzEwKSwgaXQgbG9va3MgbGlrZSBvbmx5
IHRoZSBWIGJpdCBpcyB0YWtlbjoKPgo+CXRjID0gUkVBRF9PTkNFKGRjLT50Yyk7Cj4JdGMgfD0g
bmV3X2RjLT50YSAmIFJJU0NWX0lPTU1VX0RDX1RDX1Y7Cj4JLi4uCj4JV1JJVEVfT05DRShkYy0+
dGMsIHRjKTsKPgoKWW914oCZcmUgcmlnaHQg4oCUIHRoaXMgaXMgYSByZWFsIGlzc3VlLgoKR0FE
RSB3YXMgYmVpbmcgc2V0IGluIHRoZSBzb2Z0d2FyZS1zaWRlIGRjLCBidXQgaXQgd2FzIG5vdApw
cm9wYWdhdGVkIGludG8gdGhlIGhhcmR3YXJlIERDIGluIHJpc2N2X2lvbW11X2lvZGlyX3VwZGF0
ZSgpLgoKSSBoYXZlIGFscmVhZHkgZml4ZWQgdGhpcyBpbiBteSBsb2NhbCB0cmVlLCBhbmQgSeKA
mWxsIGluY2x1ZGUgdGhlCmNoYW5nZSBpbiB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBwYXRjaHNl
dDoKICAgIHRjICY9IH5SSVNDVl9JT01NVV9EQ19UQ19HQURFOwogICAgdGMgfD0gbmV3X2RjLT50
YyAmIFJJU0NWX0lPTU1VX0RDX1RDX0dBREU7CiAgICB0YyB8PSBuZXdfZGMtPnRhICYgUklTQ1Zf
SU9NTVVfRENfVENfVjsKCj5JIHNhdyB0aGF0IHlvdSBtZW50aW9uZWQgeW91IHRlc3RlZCBpdCBv
biBRRU1VLiBBcyBmYXIgYXMgSSBrbm93LAo+bWFpbmxpbmUgUUVNVSBoYXMgbm90IHlldCBkZWNs
YXJlZCB0aGUgQU1PX0hXQUQgY2FwYWJpbGl0eS4gQ291bGQKPnlvdSBjbGFyaWZ5IHdoZXRoZXIg
eW91IHVzZWQgYSBtb2RpZmllZCBRRU1VIGZvciB0aGlzIHRlc3Q/Cj4KCkkgdXNlZCBtYWlubGlu
ZSBRRU1VLCBub3QgYSBtb2RpZmllZCBvbmUuCgpJbiBRRU1VLCBJIG9ubHkgdGVzdGVkIHRoZSBz
ZWNvbmQtc3RhZ2UgcGF0aCB3aXRoIGEKVk0gdXNpbmcgZGV2aWNlIHBhc3N0aHJvdWdoLgoKSSBk
aWQgbm90IHRlc3QgdGhlIGRpcnR5LWxvZyByZWxhdGVkIHBhcnQgdGhlcmUsCnNvIHRoYXQgcGF0
aCBjYW5ub3QgYmUgY292ZXJlZCB0aGVyZS4KClRoYXQgaXMgd2h5IEkgbm90ZWQgaW4gdGhlIFRP
RE8gdGhhdCBJIHdpbGwgYnVpbGQgYQpkZWRpY2F0ZWQgdGVzdCBjYXNlIGZvciBkaXJ0eSBsb2cg
aGFuZGxpbmcgbGF0ZXIuCgpUaGFua3MsCkZhbmd5dQoKPlRoYW5rcywKPlNodWFpCj4KPj4gICAJ
fSBlbHNlIHsKPj4gICAJCWlmICghcmlzY3ZfaW9tbXVfZnNjX3N1cHBvcnRlZChpb21tdSwgcHRf
aW5mby5mc2NfaW9zYXRwX21vZGUpKQo+PiAgIAkJCXJldHVybiAtRU5PREVWOwoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
