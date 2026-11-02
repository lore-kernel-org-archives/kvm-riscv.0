Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D29606A324
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i25QnNqc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qY0yFIqy/+O+NaYH/TA6yvlbpBIuaNxY7X5i/jHZZSg=; b=i25QnNqcUQm62V0HwKhEET/Jbd
	UbEe7G1dfhj9Md/anprVRpkWadjJyG4NZcEroH480aIUuKSCohJOmH1tRAV+b+wNsMvcNkVXqWYqp
	yQB9PvyEZw8rtzZAU4AXzyYlXRi6Y8AVOPoSt7x7KhStLpL62rxYDVlmeOdoUGNYwQ9dfiM3fELvJ
	wdb5PF5EyobQ9wjB2zRnX9OcxGvgybZsV7/dzwNq9ElVzxe/oR2GRFlOPfYA0+SCkdfkhgnPqRUSA
	YGNs3/CjalDg4ASJ5QmeK/eidqcYLag3mamR/TeA0RAjWBE3wXWyUlDS+YkMzrQs+qbNHL22YF1LP
	0cmNR6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNltA-0000000FhN8-3a71;
	Mon, 02 Nov 2026 06:51:28 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlt5-0000000FhLj-0EI6
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 06:51:27 +0000
Received: from [127.0.0.1] (unknown [122.194.100.204])
	by APP-03 (Coremail) with SMTP id rQCowAA3R5jkMuhqxeIsAA--.45599S2;
	Mon, 02 Nov 2026 14:51:16 +0800 (CST)
Message-ID: <27862416b42dd8c13a0266700d361edcd97910e1.camel@iscas.ac.cn>
Subject: Re: [kvm-unit-tests PATCH 0/7] riscv: ACPI boot and BRS-I SBI tests
From: Xiang W <wangxiang@iscas.ac.cn>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, pbonzini@redhat.com,
 	thuth@redhat.com, sunilvl@oss.qualcomm.com, tech-brs@lists.riscv.org
Date: Mon, 02 Nov 2026 14:51:16 +0800
In-Reply-To: <syzvrpkpdg5gjo4q6fgeypshwc33vzlzy3r6bvu5pqwm5iogl6@gewf5shwul3k>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
	 <syzvrpkpdg5gjo4q6fgeypshwc33vzlzy3r6bvu5pqwm5iogl6@gewf5shwul3k>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowAA3R5jkMuhqxeIsAA--.45599S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1kKryrZr18Zw43uFyDJrb_yoW8uF18pa
	y8Ga1jkws3JF18Zws29w47ur1xuws5Ar43J3WrJ3y7Wrs0vF1IyrZ2qw4q9r4UWr4kW3yq
	v3ZIvFsYg3WUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xS
	Y4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
	twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUyw
	ZcUUUUU
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_225123_469882_C44F013E 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMDktMzDkuInnmoQgMTM6MjIgKzAyMDDvvIxBbmRyZXcgSm9uZXPlhpnpgZPvvJoK
PiAKPiBUaGFua3MgZm9yIHRoaXMgc2VyaWVzLCBYaWFuZy4gSSdtIGdsYWQgdG8gc2VlIGt2bS11
bml0LXRlc3RzIGdldHRpbmcKPiB1c2VkLiBCdXQgcGxlYXNlIG1ha2Ugc3VyZSB5b3Ugd29yayB3
aXRoIHRoZSBSVkkgQlJTIGNvbW11bml0eSB0byBlbnN1cmUKPiB5b3VyIHdvcmsgaXMgYWxpZ25l
ZCB3aXRoIHRoZWlyIHBsYW5zLgo+IAo+IFRoYW5rcywKPiBkcmV3Cj4gCkhpIERyZXcsCgpUaGFu
a3MgZm9yIHRoZSByZXZpZXcuCgpBcyByZXF1ZXN0ZWQsIEkgaGF2ZSByZWFjaGVkIG91dCB0byB0
aGUgUlZJIEJSUyBjb21tdW5pdHkgKHRlY2gtYnJzQGxpc3RzLnJpc2N2Lm9yZykgdG8gYWxpZ24g
dGhpcyB3b3JrLiBUaGUgbWFpbCBJIHNlbnQgaXMgaW5jbHVkZWQgYmVsb3cgKGFsc28KQ0MnZWQg
b24gdGhpcyByZXBseSk6CgotLS0KSGkgQlJTIFRHLAoKSeKAmW0gWGlhbmcgVyBmcm9tIHRoZSBP
cGVuUnV5aSB0ZWFtIChodHRwczovL29wZW5ydXlpLmNuLykuIFdlIGFyZSB3b3JraW5nIG9uIHBy
b21vdGluZyBzdGFuZGFyZGl6ZWQgc2VydmVyIGZpcm13YXJlIGZvciBSSVNDLVYgYW5kIGFyZQpw
YXJ0aWN1bGFybHkgaW50ZXJlc3RlZCBpbiBtYWtpbmcgQlJTLUkgcHJhY3RpY2FsIHRvIGltcGxl
bWVudCBhbmQgdGVzdC4KCkFzIHBhcnQgb2YgdGhpcyBlZmZvcnQgd2UgaGF2ZSBiZWVuIGNvbnRy
aWJ1dGluZyBCUlMtSSByZWxhdGVkIHRlc3RzIGluIHR3byBwbGFjZXM6CgoxLiBGV1RTIChBQ1BJ
IC8gU01CSU9TKQogICAtIGh0dHBzOi8vZ2l0aHViLmNvbS9md3RzL2Z3dHMvcHVsbC80MwogICAt
IGh0dHBzOi8vZ2l0aHViLmNvbS9md3RzL2Z3dHMvcHVsbC80NwogICAtIGh0dHBzOi8vZ2l0aHVi
LmNvbS9md3RzL2Z3dHMvcHVsbC80OAoKMi4ga3ZtLXVuaXQtdGVzdHMgKFNCSSByZXF1aXJlbWVu
dHMpCiAgIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3ZtLXJpc2N2LzIwMjYwOTI0MDMzOTQ1
LjE3NjU4MS0xLXdhbmd4aWFuZ0Bpc2Nhcy5hYy5jbi9ULwogICAtIChjdXJyZW50IGJyYW5jaDog
aHR0cHM6Ly9naXRodWIuY29tL29wZW5SdXlpLVByb2plY3Qva3ZtLXVuaXQtdGVzdHMvdHJlZS9i
cnMtaSkKCkFuZHJldyBKb25lcyByZXZpZXdlZCB0aGUga3ZtLXVuaXQtdGVzdHMgc2VyaWVzIGFu
ZCBhc2tlZCB1cyB0byBtYWtlIHN1cmUgdGhlIHdvcmsgaXMgYWxpZ25lZCB3aXRoIHRoZSBSVkkg
QlJTIGNvbW11bml0eeKAmXMgcGxhbnMuIFRoYXQgaXMgdGhlCm1haW4gcmVhc29uIGZvciB0aGlz
IG1haWwuCgpXZSB3b3VsZCBsaWtlIHRvOgoKLSBDb25maXJtIHRoYXQgdGhlIGRpcmVjdGlvbiB3
ZSBhcmUgdGFraW5nIChCUlMtSSBBQ1BJL1NNQklPUyBjaGVja3MgaW4gZnd0cyArIFNCSSByZXF1
aXJlbWVudCB0ZXN0cyBpbiBrdm0tdW5pdC10ZXN0cykgbWF0Y2hlcyB0aGUgVEfigJlzCmV4cGVj
dGF0aW9ucy4KLSBVbmRlcnN0YW5kIHdoZXRoZXIgdGhlcmUgaXMgYWxyZWFkeSBwbGFubmVkIG9y
IG9uZ29pbmcgd29yayBvbiBCUlMtSSB0ZXN0IGNvdmVyYWdlIHRoYXQgd2Ugc2hvdWxkIGNvb3Jk
aW5hdGUgd2l0aC4KLSBHZXQgZ3VpZGFuY2Ugb24gdGhlIGtub3duIGRpc2NyZXBhbmN5IGluIE9F
X1NCSV8wNjBfMDEwIChicnNfdGVzdHMuYWRvYyBsaXN0cyBTbWNzcmluZCArIFNtY2RlbGVnLCB3
aGlsZSB0aGUgbm9ybWF0aXZlIHRleHQgb25seSBtZW50aW9ucyB0aGUKUy1tb2RlIGV4dGVuc2lv
bnMsIGFuZCBTLW1vZGUgSVNBIHN0cmluZ3MgZG8gbm90IG5vcm1hbGx5IGNvbnRhaW4gTS1tb2Rl
IGV4dGVuc2lvbnMpLgoKQW55IGZlZWRiYWNrIG9uIHByaW9yaXRpZXMsIGV4aXN0aW5nIHRlc3Qg
cGxhbnMsIG9yIHByZWZlcnJlZCBwbGFjZXMgdG8gY29udHJpYnV0ZSB3b3VsZCBiZSB2ZXJ5IGhl
bHBmdWwuCgpUaGFua3MsClhpYW5nIFcKT3BlblJ1eWkgLyBJU0NBUwp3YW5neGlhbmdAaXNjYXMu
YWMuY24KLS0tCgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgYW55dGhpbmcgZWxzZSBpcyBuZWVkZWQu
CgpUaGFua3MsClhpYW5nCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
