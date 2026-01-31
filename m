Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3BFD79740
	for <kvm-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 06:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VAYHGOw7fO6r934keyduyD/cChqAsoG+BoTnxgMzHs=; b=KD4frEIUweJ9cM
	LUxAzSzp6QqgYs/bylVcnJq7eiM63Qms6p+ZV6etbNiR4qGH5WHHXP0g/sZqas7CgpNMl2mIadvLQ
	cjW4gnXvuOXvXtlQiSuTrcRS7NXRkCF2hKD97aqIlr1+HON99DZ5iOWw7cnwg3tlE7OpO2nIc0rR1
	LQZtWYVICqwOnZdKXdR+LiRg2s19I8JiTQL6WZuJsKO+ocRNj4eNYbIkn+e/SpALC+80ixhl9xe3T
	IOlBL+xTi+WrrlT4avZLv96Lvra/OEYdVfN8RTuyQkp6W0hvkg3Hn2BAfeH27GWevWPBP3A3m/6Hc
	enS+iBpLPA/Mty6LmP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm4E5-00000002Lg7-48Hn;
	Sat, 31 Jan 2026 06:12:58 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm4E0-00000002Lfe-1b77;
	Sat, 31 Jan 2026 06:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769839966; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=2OKdCyNJhIVojli7ql3F2hJ/uL4VUVnT1i6U4jxVZT8=;
	b=HGD+EKArb0cF9TN5QS0AEQtpfbkRyzgihlo1kPocv8fBNq9YuL3FP+e4aM8MUV01KlkvcYK3/po85bKJnrmt6lLJOY+sofwU6hpqaAk53JA61tgQ4gN1nI1Pf+2UVBOsLfRG8u+jL3iFawqEGlWoFYIWURyDJ9JcbC/vm2Y1DUE=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WyCuJgA_1769839962 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 Jan 2026 14:12:44 +0800
From: fangyu.yu@linux.alibaba.com
To: radim.krcmar@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
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
	pjw@kernel.org
Subject: Re: Re: [PATCH v3 1/2] RISC-V: KVM: Support runtime configuration for per-VM's HGATP mode
Date: Sat, 31 Jan 2026 14:12:38 +0800
Message-Id: <20260131061238.52708-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <DG21QMIKJS7W.1OUK0OFL8S3A8@oss.qualcomm.com>
References: <DG21QMIKJS7W.1OUK0OFL8S3A8@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_221254_053386_238472F1 
X-CRM114-Status: GOOD (  11.19  )
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

Pj4+PiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPj4+PiAt
CWt2bV9pbmZvKCJ1c2luZyAlcyBHLXN0YWdlIHBhZ2UgdGFibGUgZm9ybWF0XG4iLCBzdHIpOwo+
Pj4+ICsJa3ZtX2luZm8oIk1heCBHLXN0YWdlIHBhZ2UgdGFibGUgZm9ybWF0ICVzXG4iLCBzdHIp
Owo+Pj4KPj4+RnVuIGZhY3Q6IHRoZSBJU0EgZG9lc24ndCBkZWZpbmUgdGhlIHNhbWUgaGllcmFy
Y2h5IGZvciBoZ2F0cCBtb2RlcyBhcwo+Pj5pdCBkb2VzIGZvciBzYXRwIG1vZGVzLCBzbyB3ZSBj
b3VsZCBoYXZlIGp1c3QgU3Y1N3g0IGFuZCBub3RoaW5nIGJlbG93Lgo+Pj4KPj4+V2UgY291bGQg
ZG8ganVzdCB3aXRoIGEgY29kZSBjb21tZW50IHRoYXQgd2UncmUgYXNzdW1pbmcgdmVuZG9ycyB3
aWxsIGRvCj4+PmJldHRlciwgYnV0IEknZCByYXRoZXIgbm90IGludHJvZHVjZSBtb3JlIGFzc3Vt
cHRpb25zLi4uCj4+PkkgdGhpbmsgdGhlIGVhc2llc3Qgd291bGQgYmUgdG8ga3ZtX3Jpc2N2X2dz
dGFnZV9tb2RlX2RldGVjdCgpIGxldmVscyBpbgo+Pj5yZXZlcnNlIGFuZCBzdG9wIG9uIHRoZSBm
aXJzdCBvbmUgdGhhdCBpcyBub3Qgc3VwcG9ydGVkLgo+Pj4oSSdsbCByZXBseSB3aXRoIGEgcGF0
Y2ggbGF0ZXIuKQo+Pgo+PiBQbGVhc2UgcmVmZXIgdG8gdGhlIGRpc2N1c3Npb24gaGVyZToKPj4g
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvaXNzdWVzLzIyMDgKPj4g
SWYgU3Y1N3g0IGlzIGltcGxlbWVudGVkLCB0aGVuIFN2NDh4NCBhbmQgU3YzOXg0IG11c3QgYWxz
byBiZSBpbXBsZW1lbnRlZC4KPgo+SSBkb24ndCB0aGluayBzbywgc2FkbHksIGJ1dCB3ZSdyZSBt
b3N0bHkgZGVhbGluZyB3aXRoIHRlY2huaWNhbGl0aWVzCj5oZXJlLiAgQXMgQW5kcmV3IHBvaW50
ZWQgb3V0Ogo+Cj4gICJUaGUgSCBleHRlbnNpb24gaXRzZWxmIGRvZXMgbm90IGltcG9zZSB0aGlz
IHJlcXVpcmVtZW50LCBzbwo+ICB0ZWNobmljYWxseSBTdjU3eDQgd2l0aG91dCBTdjQ4eDQgY29u
Zm9ybXMgdG8gdGhlIEggZXh0ZW5zaW9uIHNwZWMuIgo+Cj5UaGlzIG1lYW5zIGl0J3MgY29tcGxl
dGVseSB2YWxpZCB0byBzdXBwb3J0IHtCYXJlLCBTdjM5eDQsIFN2NTd4NH0uCj5UaGUgUlZBMjMg
cHJvZmlsZSBpbXBvc2VzIGFkZGl0aW9uYWwgY29uc3RyYWludHMgdmlhIFNoZ2F0cGE6Cj4KPiAg
IkZvciBlYWNoIHN1cHBvcnRlZCB2aXJ0dWFsIG1lbW9yeSBzY2hlbWUgU3ZOTiBzdXBwb3J0ZWQg
aW4gc2F0cCwgdGhlCj4gIGNvcnJlc3BvbmRpbmcgaGdhdHAgU3ZOTng0IG1vZGUgbXVzdCBiZSBz
dXBwb3J0ZWQuCj4gIFRoZSBoZ2F0cCBtb2RlIEJhcmUgbXVzdCBhbHNvIGJlIHN1cHBvcnRlZC4i
Cj4KPlRoZSByZXF1aXJlbWVudCBvbmx5IGdvZXMgb25lIHdheSwgc28gYW4gUlZBMjMgaW1wbGVt
ZW50YXRpb24gd2l0aCBqdXN0Cj57QmFyZSwgU3YzOX0gaW4gc2F0cCBjb3VsZCBzdXBwb3J0IHtC
YXJlLCBTdjM5eDQsIFN2NTd4NH0gaW4gaGdhdHAsCj5iZWNhdXNlIFJWQTIzIG5vciBJU0EgcHJl
dmVudCBTdjU3eDQgdG8gYmUgdGhlcmUuCj5Ob3QgdGhhdCBJIGV4cGVjdCBhbnkgc2Vuc2libGUg
aW1wbGVtZW50YXRpb24gdG8gZG8gdGhpcy4uLgo+Cj5CdHcuIGRvIHdlIHRhcmdldCBvbmx5IFJW
QTIzIHdpdGggS1ZNPwoKVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4KCk5vLCBJIGRvbid0
IHRoaW5rIHdlIHNob3VsZCBhc3N1bWUgd2UncmUgdGFyZ2V0aW5nIG9ubHkgUlZBMjMgKG9yIGFu
eQpzcGVjaWZpYyBwcm9maWxlKSB3aXRoIEtWTS4gSW4gZ2VuZXJhbCBLVk0gc2hvdWxkIHdvcmsg
d2l0aCBhbnkKSC1leHRlbnNpb24gaW1wbGVtZW50YXRpb24gdGhhdCBzYXRpc2ZpZXMgS1ZN4oCZ
cyByZXF1aXJlbWVudHMsIHdpdGhvdXQKZGVwZW5kaW5nIG9uIGFkZGl0aW9uYWwgcHJvZmlsZSBj
b25zdHJhaW50cyB1bmxlc3MgZXhwbGljaXRseSBzdGF0ZWQuCgpHaXZlbiB0aGF0LCByZWx5aW5n
IG9uIOKAnGlmIFN2NTd4NCBleGlzdHMgdGhlbiBTdjQ4eDQvU3YzOXg0IG11c3QgZXhpc3TigJ0K
d291bGQgYmUgYW4gZXh0cmEgYXNzdW1wdGlvbi4gVG8gYXZvaWQgdGhhdCwgSeKAmWxsIHVwZGF0
ZSB0aGUgZGV0ZWN0aW9uCmxvZ2ljIHRvIHByb2JlIG1vZGVzIGluZGVwZW5kZW50bHkgYW5kIHJl
Y29yZCBhbGwgc3VwcG9ydGVkIG1vZGVzIChhbmQKZGVyaXZlIHRoZSBtYXggbGV2ZWwgZnJvbSB0
aGUgcmVzdWx0aW5nIHNldCBieSBkZWZhdWx0KS4KCkFsc28sIEkgd2lsbCBleHBvc2UgdGhlIGZ1
bGwgc2V0IG9mIGRldGVjdGVkIGhvc3Qtc3VwcG9ydGVkIEhHQVRQLk1PREUKdmFsdWVzIHRvIHVz
ZXJzcGFjZSB2aWEgS1ZNX0NIRUNLX0VYVEVOU0lPTihLVk1fQ0FQX1JJU0NWX1NFVF9IR0FUUF9N
T0RFKQphcyBhIGJpdG1hc2ssIHNvIHVzZXJzcGFjZSBjYW4gc2VsZWN0IGFuIGFwcHJvcHJpYXRl
IG1vZGUuCgo+Cj5UaGFua3MKClRoYW5rcywKRmFuZ3l1CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
